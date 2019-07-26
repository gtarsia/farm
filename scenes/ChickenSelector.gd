extends Node
class_name ChickenSelector

var chicken: Chicken = null
var has_chicken: bool = false

func _input(event):
  if (event is InputEventMouseButton 
      and event.button_index == BUTTON_RIGHT):
    move_chicken(event.position)

func move_chicken(target):
  if not has_chicken:
    return
  chicken.set_kinematic_target(target)
  
func select_chicken(_chicken: Chicken):
  if has_chicken:
    chicken.selected = false
  chicken = _chicken
  has_chicken = true
  chicken.selected = true

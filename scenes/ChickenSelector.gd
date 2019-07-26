extends Node
class_name ChickenSelector

var chicken: Chicken = null
var has_chicken: bool = false
var target: Vector2
var has_target: bool = false

func _process(delta):
  check_chicken_reached_target()

func _input(event):
  if (event is InputEventMouseButton 
      and event.button_index == BUTTON_RIGHT):
    move_chicken(event.position)

func check_chicken_reached_target():
  if has_target:
    if chicken.position.distance_to(target) < 1:
      has_target = false
      chicken.stop()

func move_chicken(_target):
  if not has_chicken:
    return
  target = _target
  has_target = true
  chicken.set_kinematic_target(target - chicken.position)
  
func select_chicken(_chicken: Chicken):
  if has_chicken:
    chicken.selected = false
  chicken = _chicken
  has_chicken = true
  chicken.selected = true

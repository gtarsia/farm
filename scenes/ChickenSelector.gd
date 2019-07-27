extends Node
class_name ChickenSelector

var chicken = null
var has_chicken: bool = false

func _input(event):
  if event is InputEventMouseButton: 
    if (event.button_index == BUTTON_RIGHT
        and event.pressed):
      move_chicken(event.position)
  elif event is InputEventKey:
    if (event.scancode == KEY_W
        and event.pressed):
      chicken.spawn_bomb()

func move_chicken(target):
  if not has_chicken:
    return
  chicken = chicken.set_kinematic_target(target)
  pass
  
func select_chicken(_chicken: Chicken):
  if has_chicken:
    chicken.selected = false
  chicken = _chicken
  has_chicken = true
  chicken.selected = true

func shake(duration, frequency, amplitude):
  get_parent().get_node('Camera2D').shake(duration, frequency, amplitude)

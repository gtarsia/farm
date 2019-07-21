extends Chicken

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  var velocity = Vector2()
  if Input.is_action_pressed("ui_right"):  
    velocity.x = 1 
  elif Input.is_action_pressed("ui_left"):
    velocity.x = -1
  if Input.is_action_pressed("ui_down"):
    velocity.y = 1
  elif Input.is_action_pressed("ui_up"):
    velocity.y = -1
  set_velocity(velocity)
  ._process(delta)
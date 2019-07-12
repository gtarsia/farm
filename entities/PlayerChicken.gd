extends Chicken

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  up = false
  down = false
  left = false
  right = false
  if Input.is_action_pressed("ui_right"):
    right = true
  elif Input.is_action_pressed("ui_left"):
    left = true
  if Input.is_action_pressed("ui_down"):
    down = true
  if Input.is_action_pressed("ui_up"):
    up = true
  ._process(delta)
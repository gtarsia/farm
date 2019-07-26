extends Chicken

var target: Vector2 = Vector2()
var has_target: bool = false

func _process(delta):
  var body = self
  if has_target:
    if body.position.distance_to(target) < 0.2:
      has_target = false
    else:
      body.move_and_slide(target * delta)
  
func set_target(_target: Vector2):
  target = _target
  has_target = true
extends Chicken
class_name ChickenKinematic

var speed = 100
var target: Vector2 = Vector2()
var velocity: Vector2 = Vector2()
var has_target: bool = false

func _ready():
  # I do this so I replace this with the ones on ChickenRigid
  # But I keep them in the editor so I get hints in the editor
  for child in get_children():
    remove_child(child)
  mode = Modes.KINEMATIC
  kinematic = self

func _process(delta):
  var body = self
  if has_target:
    if body.position.distance_to(target) <= 1:
      has_target = false
    else:
      body.move_and_slide(velocity)
  
func set_target(_target: Vector2):
  var body = self
  target = _target
  velocity = (_target - body.position).normalized() * speed
  has_target = true

func stop():
  has_target = false
  
func is_moving():
  return has_target
  
func is_moving_left():
  var body = self
  return has_target and velocity.x < 0
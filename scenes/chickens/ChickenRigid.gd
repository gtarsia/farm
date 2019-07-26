extends Chicken
class_name ChickenRigid

var body = null

func _ready():
  body = self

func _physics_process(delta):
  body.rotation = 0

func set_linear_velocity(value: Vector2):
  body.linear_velocity = value

func stop():
  set_linear_velocity(Vector2())
  
func is_moving():
  return body.linear_velocity.length() > 3
  
func is_moving_left():
  return body.linear_velocity.x < 0
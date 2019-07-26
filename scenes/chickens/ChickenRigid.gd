extends Chicken
class_name ChickenRigid

func _physics_process(delta):
  rotation = 0

func set_linear_velocity(value: Vector2):
  linear_velocity = value
  set_animations()
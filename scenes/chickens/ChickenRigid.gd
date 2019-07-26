extends Chicken
class_name ChickenRigid

func set_linear_velocity(value: Vector2):
  linear_velocity = value
  set_animations()
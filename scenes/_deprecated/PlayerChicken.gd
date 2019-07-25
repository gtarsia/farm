extends Chicken

var target: Vector2
var hasTarget: bool = false

func _process(delta):
  if (hasTarget):
    if (position.distance_to(target) < 1):
      hasTarget = false
      set_velocity(Vector2())

func _input(event):
  if event is InputEventMouseButton:
    hasTarget = true
    target = event.position
    set_velocity(target - self.position)
    print("Mouse Click/Unclick at: ", event.position)

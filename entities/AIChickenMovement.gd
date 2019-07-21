extends Node

enum AIChickenState {READY, IDLE_MOVING}
var state = AIChickenState.READY
var chicken: Chicken = null

func _ready():
  chicken = get_parent()

func ready():
  state = AIChickenState.READY

func random_movement():
  # There are 8 directions
  # I pick a random one from those 8
  # 0 is down left, 1 is left and so on
  var velocity = Vector2()
  var direction = randi() % 9
  if (direction == 0 && direction <= 2):
    velocity.x = -1
  if (direction >= 2 && direction <= 4):
    velocity.y = -1
  if (direction >= 4 && direction <= 6):
    velocity.x = 1
  if (direction >= 6 && direction <= 8):
    velocity.y = 1
  chicken.set_velocity(velocity)

func _on_StartMoveTimer_timeout():
  random_movement()
  state = AIChickenState.IDLE_MOVING
  $MovingTimer.start()

func _on_MovingTimer_timeout():
  chicken.set_velocity(Vector2())
  ready()
  $StartMoveTimer.start()
  pass # Replace with function body.


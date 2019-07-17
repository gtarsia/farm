extends Chicken

enum AIChickenState {READY, IDLE_MOVING}
var state = AIChickenState.READY

func ready():
  state = AIChickenState.READY

func random_movement():
  # There are 8 directions
  # I pick a random one from those 8
  # 0 is down left, 1 is left and so on
  reset_movement()
  var direction = randi() % 9
  if (direction == 0 && direction <= 2):
    left = true
  if (direction >= 2 && direction <= 4):
    up = true
  if (direction >= 4 && direction <= 6):
    right = true
  if (direction >= 6 && direction <= 8):
    down = true

func _on_StartMoveTimer_timeout():
  random_movement()
  state = AIChickenState.IDLE_MOVING
  $MovingTimer.start()

func _on_MovingTimer_timeout():
  reset_movement()
  ready()
  $StartMoveTimer.start()
  pass # Replace with function body.


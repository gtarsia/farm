extends Chicken

enum AIChickenState {IDLE, MOVING}
var state = AIChickenState.IDLE

func _process(delta):
  print(state)
  pass
  
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
  state = AIChickenState.MOVING
  $MovingTimer.start()

func _on_MovingTimer_timeout():
  reset_movement()
  state = AIChickenState.IDLE
  $StartMoveTimer.start()
  pass # Replace with function body.


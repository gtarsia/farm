extends Chicken

enum AIChickenState {IDLE, MOVING}
var state = AIChickenState.IDLE

func _process(delta):
  print(state)
  pass

func _on_StartMoveTimer_timeout():
  state = AIChickenState.MOVING
  $MovingTimer.start()

func _on_MovingTimer_timeout():
  state = AIChickenState.IDLE
  $StartMoveTimer.start()
  pass # Replace with function body.


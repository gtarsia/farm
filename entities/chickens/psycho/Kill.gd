extends Node

var this: Chicken = null
var target: Chicken = null

func _ready():
  this = get_parent()
  
func _process(delta):
  if (target):
    kill()
  
func kill():
  target.queue_free()
  target = null
  $GoKillTimer.start()

func _on_GoKillTimer_timeout():
  var chickens = get_tree().get_nodes_in_group('chickens')
  for chicken in chickens:
    if(chicken != this):
      target = chicken
      break
  # var vector = Vector2(30, 30)
  # chicken.move_and_slide(vector * chicken.speed)

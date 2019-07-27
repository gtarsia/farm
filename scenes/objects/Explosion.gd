extends Sprite

func _ready():
  pass
  
func _enter_tree():
  var camera = get_tree().get_nodes_in_group('cameras')[0]
  camera.shake(.5, 15, 8)
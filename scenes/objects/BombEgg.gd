extends Sprite

var explosion_scene = null

func _ready():
  explosion_scene = load('res://scenes/objects/Explosion.tscn')

func _on_Explode_timeout():
  var explosion = explosion_scene.instance()
  explosion.position = position
  get_parent().add_child(explosion)
  queue_free()
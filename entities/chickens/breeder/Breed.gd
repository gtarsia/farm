extends Node

var chicken: Chicken = null

# Called when the node enters the scene tree for the first time.
func _ready():
  chicken = get_parent()
  pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func breed():
  var scene = load("res://entities/AIChicken.tscn")
  var child = scene.instance()
  child.position.x = chicken.position.x
  child.position.y = chicken.position.y
  chicken.get_parent().add_child(child)

func _on_Breed_timeout():
  breed()
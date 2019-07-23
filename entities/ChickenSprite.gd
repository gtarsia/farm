tool
extends Sprite

export(int) var chicken_sprite = 0 setget set_chicken_sprite

# Called when the node enters the scene tree for the first time.
func _ready():  
  pass # Replace with function body.

func set_chicken_sprite(newVal):
  if (Engine.is_editor_hint()):
    if (newVal >= 0 && newVal <= 3):
      chicken_sprite = newVal
      region_rect.position.x = newVal * 16
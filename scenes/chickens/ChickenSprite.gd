tool
extends Sprite

export(int) var chicken_sprite = 0 setget set_chicken_sprite
var outlined: bool = false setget set_outline
var original_material = null

# Called when the node enters the scene tree for the first time.
func _ready():
  if not Engine.is_editor_hint():
    original_material = material
    material = null

func set_chicken_sprite(newVal):
  if (Engine.is_editor_hint()):
    if (newVal >= 0 && newVal <= 3):
      chicken_sprite = newVal
      region_rect.position.x = newVal * 16
  
func set_outline(newVal):
  outlined = newVal
  if (outlined):
    material = original_material
  else:
    material = null
extends RigidBody2D

class_name Chicken

export var speed = 20  # How fast the player will move (pixels/sec).
var corpse_scene = preload("res://scenes/objects/ChickenCorpse.tscn")
var selector = null
var selected: bool = false setget set_selected 

func _process(delta):
  selector = get_parent()
  pass
  
func _physics_process(delta):
  rotation = 0 

func set_velocity(_velocity: Vector2):
  linear_velocity = _velocity.normalized() * speed
  set_animations()

func stop():
  set_velocity(Vector2())
  
func set_animations():
  if linear_velocity.length() > 0:
    $Sprite/AnimationPlayer.play("walk")
    if (linear_velocity.x != 0):
      $Sprite.flip_h = linear_velocity.x < 0
  else:
    $Sprite/AnimationPlayer.stop()
    $Sprite.frame = 0

func die():
  var corpse = corpse_scene.instance()
  corpse.position = position
  get_parent().add_child(corpse)
  queue_free()

func _on_Selector_input_event(viewport, event, shape_idx):
  if (event is InputEventMouseButton
      and event.button_index == BUTTON_LEFT):
    selector.select_chicken(self)
  
func rigid_move(_velocity):
  set_velocity(_velocity)

func kinematic_move(_velocity):
  set_velocity(_velocity)
  
func set_message(msg):
  $Message.text = msg
  
func set_selected(newVal):
  selected = newVal
  set_outline(newVal)
  
func set_outline(outlined: bool):
  $Sprite.outlined = outlined
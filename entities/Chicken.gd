extends KinematicBody2D

class_name Chicken

export var speed = 20  # How fast the player will move (pixels/sec).
var velocity: Vector2 = Vector2()
var corpse_scene = preload("res://entities/objects/ChickenCorpse.tscn")

# warning-ignore:unused_argument
func _process(delta):
  move_and_slide(velocity * speed)

func set_velocity(_velocity: Vector2):
  velocity = _velocity.normalized()
  if velocity.length() > 0:
    $Sprite/AnimationPlayer.play("walk")
    if (velocity.x != 0):
      $Sprite.flip_h = velocity.x < 0
  else:
    $Sprite/AnimationPlayer.stop()
    $Sprite.frame = 0

func die():
  var corpse = corpse_scene.instance()
  corpse.position = position
  get_parent().add_child(corpse)
  queue_free()

func set_message(msg):
  $Message.text = msg

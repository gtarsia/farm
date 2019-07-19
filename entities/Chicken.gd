extends KinematicBody2D

class_name Chicken, "res://entities/Chicken.gd"

export var speed = 20  # How fast the player will move (pixels/sec).
var right = false
var left = false
var up = false
var down = false
var screen_size  # Size of the game window.

func _ready():
  screen_size = get_viewport_rect().size

func _process(delta):
  var velocity = Vector2()  # The player's movement vector.
  if right:
    velocity.x += 1
  if left:
    velocity.x -= 1
  if down:
    velocity.y += 1
  if up:
    velocity.y -= 1
  if velocity.length() > 0:
    velocity = velocity.normalized()
    $Sprite/AnimationPlayer.play("walk")
    if (velocity.x != 0):
      $Sprite.flip_h = velocity.x < 0
  else:
    $Sprite/AnimationPlayer.stop()
    $Sprite.frame = 0
  move_and_slide(velocity * speed)

func reset_movement():
  left = false
  right = false
  up = false
  down = false

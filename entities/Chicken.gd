extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Declare member variables here. Examples:
export var speed = 20  # How fast the player will move (pixels/sec).
var screen_size  # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready():
  screen_size = get_viewport_rect().size

func _process(delta):
  var velocity = Vector2()  # The player's movement vector.
  if Input.is_action_pressed("ui_right"):
    velocity.x += 1
  if Input.is_action_pressed("ui_left"):
    velocity.x -= 1
  if Input.is_action_pressed("ui_down"):
    velocity.y += 1
  if Input.is_action_pressed("ui_up"):
    velocity.y -= 1
  if velocity.length() > 0:
    velocity = velocity.normalized() * speed
    $Sprite/AnimationPlayer.play("walk")
    if (velocity.x != 0):
      $Sprite.flip_h = velocity.x < 0
  else:
    $Sprite/AnimationPlayer.stop()
  move_and_slide(velocity * speed)
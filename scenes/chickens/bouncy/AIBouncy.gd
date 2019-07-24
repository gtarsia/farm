extends Chicken

export var force = 300

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#  pass

func _on_AIBouncy_body_entered(body: RigidBody2D):
  if (not body is Chicken):
    return
  var direction = body.position - self.position
  body.apply_central_impulse(direction.normalized() * force)
  pass # Replace with function body.

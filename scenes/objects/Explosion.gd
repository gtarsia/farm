extends Area2D

var first = true
var second = false
  
func _physics_process(delta):
  if second:
    return
  if first:
    first = false
  else:
    second = true
    explode()
  
func explode():
  $Explosion/AnimationPlayer.play('explode')
  var camera = get_tree().get_nodes_in_group('cameras')[0]
  camera.shake(.2, 15, 8)
  var bodies = get_overlapping_bodies()
  for body in bodies:
    if body is RigidBody2D:
      var direction = (body.position - position).normalized()
      body.apply_central_impulse(direction*300)
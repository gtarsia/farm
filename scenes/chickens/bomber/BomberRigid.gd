extends ChickenRigid
class_name BomberRigid

func get_kinematic_scene():
  var scene = load("res://scenes/chickens/bomber/BomberKinematic.tscn")
  return scene.instance()
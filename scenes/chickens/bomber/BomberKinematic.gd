extends ChickenKinematic
class_name BomberKinematic

var bomb_scene = null

func _ready():
  bomb_scene = preload("res://scenes/objects/BombEgg.tscn")

func first_ability():
  spawn_bomb()

func spawn_bomb():
  var body = self
  var bomb = bomb_scene.instance()
  bomb.position = body.position
  get_parent().add_child(bomb)
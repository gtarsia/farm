extends Node

class_name Chicken

var corpse_scene = preload("res://scenes/objects/ChickenCorpse.tscn")
var selector = null
var selected: bool = false setget set_selected 
var kinematic = null

enum Modes {RIGID, KINEMATIC}
var mode = Modes.RIGID

func _ready():
  var scene = load("res://scenes/chickens/ChickenKinematic.tscn")
  kinematic = scene.instance()
  selector = get_parent()

func _process(delta):
  set_animations()

func set_animations():
  var body = self
  if body.is_moving():
    $Sprite/AnimationPlayer.play("walk")
    $Sprite.flip_h = body.is_moving_left()
  else:
    $Sprite/AnimationPlayer.stop()
    $Sprite.frame = 0

func die():
  var body = self
  var corpse = corpse_scene.instance()
  corpse.position = body.position
  get_parent().add_child(corpse)
  queue_free()

func _on_Selector_input_event(viewport, event, shape_idx):
  if (event is InputEventMouseButton
      and event.button_index == BUTTON_LEFT):
    selector.select_chicken(self)
  
func move_rigid(_velocity):
  var body = self
  
func set_kinematic_target(target):
  if mode == Modes.RIGID:
    Switcher.switch(self, kinematic)
    mode = Modes.KINEMATIC
  kinematic.set_target(target)
  
func set_message(msg):
  $Message.text = msg
  
func set_selected(newVal):
  selected = newVal
  set_outline(newVal)
  
func set_outline(outlined: bool):
  $Sprite.outlined = outlined
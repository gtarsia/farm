extends Node2D

func _process(delta):
  if Input.is_action_pressed("ui_quit"):
    get_tree().quit()
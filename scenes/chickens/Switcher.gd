extends Node
class_name Switcher

static func switch(from: Node, to: Node):
  to.position = from.position
  var parent = from.get_parent()
  for child in from.get_children():
    from.remove_child(child)
    to.add_child(child)
  from.replace_by(to)
    
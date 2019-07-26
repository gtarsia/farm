extends Node
class_name Switcher

static func switch(from: Node, to: Node):
  to.position = from.position
  from.replace_by(to)
    
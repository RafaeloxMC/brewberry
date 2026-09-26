extends Area2D

@export var straw: PackedScene

var dragging := false
var drag_offset := Vector2.ZERO

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action("lmb") && event.is_pressed():
		var node: Node2D = straw.instantiate()
		node.global_position = self.global_position
		node.scale = Vector2(8, 8)
		get_tree().current_scene.add_child(node)
		print("Straw placed")

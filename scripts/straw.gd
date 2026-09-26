extends Area2D

var dragging := true
var drag_offset := Vector2.ZERO

func _input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action("lmb"):
		if event.pressed:
			dragging = true
			drag_offset = global_position - get_global_mouse_position()
			get_viewport().set_input_as_handled()
		else:
			dragging = false

func _process(_delta: float) -> void:
	if dragging && GameManager.is_dragging == null:
		global_position = get_global_mouse_position() + drag_offset
	else:
		if self.get_overlapping_areas().size() > 0:
			for area in self.get_overlapping_areas():
				if not (area.get_child_count() > 0 && area.get_child(0) is AnimatedSprite2D):
					continue
				var child: AnimatedSprite2D = area.get_child(0)
				child.play(child.animation.split("_")[0] + ("_foam" if child.animation.split("_")[1] == "fill" else "") + "_straw")
				print("Added straw to drink")
		self.queue_free()

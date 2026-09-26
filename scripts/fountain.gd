extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action("lmb") and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		print("Lmb")
		if self.get_overlapping_areas().size() > 0 && GameManager.is_dragging == null:
			for area in self.get_overlapping_areas():
				if area is Area2D && area.get_child(0) is AnimatedSprite2D && !(area.get_child(0) as AnimatedSprite2D).animation.ends_with("_fill"):
					area.get_child(0).play(area.size + "_fill")
					animated_sprite_2d.play("fill")

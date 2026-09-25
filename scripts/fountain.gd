extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _on_button_mouse_entered() -> void:
	if self.get_overlapping_areas().size() > 0 && GameManager.is_dragging == null:
		for area in self.get_overlapping_areas():
			if area is Area2D && area.get_child(0) is AnimatedSprite2D && !(area.get_child(0) as AnimatedSprite2D).animation.ends_with("_fill"):
				area.get_child(0).play(area.size + "_fill")
				animated_sprite_2d.play("fill")

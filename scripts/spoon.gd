extends Area2D

func _process(_delta: float) -> void:
	if self.get_overlapping_areas().size() > 0:
		for area in self.get_overlapping_areas():
			if area is not Cup:
				continue
			var node: AnimatedSprite2D = area.get_child(0)
			if node.animation.contains("_foam") || node.animation.contains("_fill"):
				node.play(area.size + "_foamless" + ("_straw" if node.animation.ends_with("_straw") else ""))

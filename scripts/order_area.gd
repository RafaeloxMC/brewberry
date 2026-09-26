extends Area2D

func _process(_delta: float) -> void:
	if self.get_overlapping_areas().size() > 0 && GameManager.is_dragging == null:
		for area in self.get_overlapping_areas():
			if area is not Cup:
				continue
			if area.size == GameManager.current_order_size:
				if GameManager.current_order_foam && !(area.get_child(0).animation.contains("_foam") || area.get_child(0).animation.contains("_fill")):
					print("No foam")
					return
				if GameManager.current_order_straw && !area.get_child(0).animation.contains("_straw"):
					print("No straw")
					return
				var val = 1 if area.size == "sm" else 3 if area.size == "md" else 5
				GameManager.sell.emit(val)
				area.queue_free()

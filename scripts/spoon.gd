extends Area2D

var origin: Vector2

func _ready() -> void:
	origin = self.global_position

func _process(_delta: float) -> void:
	if GameManager.is_dragging == self and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		position = get_global_mouse_position()
	else:
		if GameManager.is_dragging == self:
			GameManager.is_dragging = null
			move_to(origin, 0.25)
		
	self.skew = (get_window().size.x / 2.0 - position.x) / get_window().size.x / 2.0
	self.rotation = -(get_window().size.x / 2.0 - position.x) / get_window().size.x / 2.0
	
	if self.get_overlapping_areas().size() > 0:
		for area in self.get_overlapping_areas():
			if area is not Cup:
				continue
			var node: AnimatedSprite2D = area.get_child(0)
			if node.animation.contains("_foam") || node.animation.contains("_fill"):
				node.play(area.size + "_foamless" + ("_straw" if node.animation.ends_with("_straw") else ""))
				
func _on_mouse_entered():
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && GameManager.is_dragging == null:
		GameManager.is_dragging = self

func _on_mouse_exited():
	if GameManager.is_dragging == self:
		GameManager.is_dragging = null

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action("lmb") && GameManager.is_dragging == null:
		GameManager.is_dragging = self
		
func move_to(target: Vector2, duration: float):
	var tween := create_tween()
	tween.tween_property(self, "global_position", target, duration).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)

class_name Cup
extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# sizes sm, md, lg
@export var size := "sm"

func _ready() -> void:
	animated_sprite_2d.play(size + "_empty")

func fill() -> void:
	animated_sprite_2d.play(size + "_fill")

func _on_mouse_entered():
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && GameManager.is_dragging == null:
		GameManager.is_dragging = self

func _on_mouse_exited():
	if GameManager.is_dragging == self:
		GameManager.is_dragging = null

func _process(_delta: float):
	if GameManager.is_dragging == self and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		position = get_global_mouse_position()
	self.skew = (get_window().size.x / 2.0 - position.x) / get_window().size.x / 2.0
	self.rotation = -(get_window().size.x / 2.0 - position.x) / get_window().size.x / 2.0


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action("lmb") && GameManager.is_dragging == null:
		GameManager.is_dragging = self

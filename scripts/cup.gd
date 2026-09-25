extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# sizes sm, md, lg
@export var size := "sm"

func _ready() -> void:
	animated_sprite_2d.play(size + "_empty")

func fill() -> void:
	animated_sprite_2d.play(size + "_fill")

func _on_mouse_entered():
	print("Entered " + name)
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && GameManager.is_dragging == null:
		GameManager.is_dragging = self

func _on_mouse_exited():
	if GameManager.is_dragging == self:
		GameManager.is_dragging = null

func _process(_delta: float):
	if GameManager.is_dragging == self and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		position = get_global_mouse_position()

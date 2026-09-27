class_name Cup
extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

# sizes sm, md, lg
@export var size := "sm"

var origin := Vector2.ZERO

func _ready() -> void:
	animated_sprite_2d.play(size + "_empty")
	origin = self.global_position

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
	else:
		if GameManager.is_dragging == self:
			GameManager.is_dragging = null
			audio_stream_player.volume_db = randf_range(-8, -6)
			audio_stream_player.play()
			if self.get_overlapping_areas().size() > 0:
				for area in self.get_overlapping_areas():
					if area.name == "Bin":
						self.global_position = origin
						animated_sprite_2d.play(size + "_empty")
		
	self.skew = ((get_viewport_rect().size.x / 2.0) - position.x) / get_viewport_rect().size.x / 2.0
	self.rotation = -(((get_viewport_rect().size.x / 2.0) - position.x) / get_viewport_rect().size.x / 2.0)

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action("lmb") && GameManager.is_dragging == null:
		GameManager.is_dragging = self

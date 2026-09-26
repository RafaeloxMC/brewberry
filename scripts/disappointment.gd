extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.right_button_pressed.connect(_on_disappointment)
	
func _on_disappointment() -> void:
	animation_player.play("disappointment")
	await animation_player.animation_finished
	self.queue_free()

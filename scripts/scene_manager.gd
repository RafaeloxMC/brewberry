extends Node

@export var scenes: Dictionary[String, PackedScene]
@onready var transition: ColorRect = $CanvasLayer/Transition
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.play("in")

func call_packed(scene: PackedScene) -> void:
	animation_player.play_backwards("in")
	await animation_player.animation_finished
	get_tree().change_scene_to_packed(scene)
	animation_player.play("in")

func call_scene(scene: String) -> void:
	if scenes.get(scene):
		call_packed(scenes.get(scene))

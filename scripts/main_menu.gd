extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_play_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("lmb"):
		SceneManager.call_scene("game")
		

func _on_quit_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("lmb"):
		get_tree().quit()

func _on_play_mouse_entered() -> void:
	animation_player.play("phone")

func _on_play_mouse_exited() -> void:
	animation_player.play_backwards("phone")


func _on_quit_mouse_entered() -> void:
	animation_player.play("cash_register")

func _on_quit_mouse_exited() -> void:
	animation_player.play_backwards("cash_register")

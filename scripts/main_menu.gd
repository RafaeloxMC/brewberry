extends Control

func _on_play_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("lmb"):
		SceneManager.call_scene("game")
		

func _on_quit_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("lmb"):
		get_tree().quit()

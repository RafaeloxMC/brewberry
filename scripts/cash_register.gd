extends StaticBody2D

@onready var label: Label = $Label

func _process(_delta: float) -> void:
	label.text = str(GameManager.cash).lpad(6, "0")

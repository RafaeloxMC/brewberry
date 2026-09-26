extends Node2D

@onready var size: Label = $First/Size
@onready var foam: Label = $Second/Foam
@onready var straw: Label = $Third/Straw

func _process(_delta: float) -> void:
	size.text = "large" if GameManager.current_order_size == "lg" else "normal" if GameManager.current_order_size == "md" else "small"
	foam.text = "foam" if GameManager.current_order_foam else "no foam"
	straw.text = "with straw" if GameManager.current_order_straw else "no straw"

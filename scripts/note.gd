extends Node2D

@onready var size: Label = $First/Size
@onready var foam: Label = $Second/Foam
@onready var straw: Label = $Third/Straw

func _process(_delta: float) -> void:
	size.text = GameManager.current_order_size
	foam.text = "ye" if GameManager.current_order_foam else "no"
	straw.text = "st" if GameManager.current_order_straw else "no"

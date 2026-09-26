extends Node

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

signal sell(price: int)

var is_dragging: Node2D = null
var cash := 0

var current_order_active = false
var current_order_size = "lg"
var current_order_foam = true
var current_order_straw = false

func _ready() -> void:
	sell.connect(_on_sold)
	
func _on_sold(price: int) -> void:
	audio_stream_player.play(0.3)
	cash += price
	generate_new_order()
	# integrate order_active = false and button to accept order

func generate_new_order() -> void:
	current_order_size = "sm" if randi_range(0, 1) == 0 else "md" if randi_range(0, 1) == 0 else "lg" 
	current_order_foam = true if randi_range(0, 1) == 0 else false
	current_order_straw = true if randi_range(0, 1) == 0 else false

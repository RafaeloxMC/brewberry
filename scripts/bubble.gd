extends TextureRect

@onready var label: Label = $Label
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var phrases := ["oooh, so yummy!", "this is delicious", "yum!", "ooh, root beer so good", "this tastes amazing"]

func _ready() -> void:
	GameManager.sell.connect(_handle_sell)
	_handle_sell(0)
	
func _handle_sell(_price: int) -> void:
	if self.flip_h:
		if GameManager.cash == 0:
			modulate = Color(1, 1, 1, 0)
			return
		label.text = phrases[randi_range(0, phrases.size() - 1)]
		animation_player.play("show_and_hide")
	else:
		await get_tree().process_frame
		label.text = "i'd like one " + GameManager.current_order_size + " root beer " + ("with" if GameManager.current_order_foam else "without") + " foam and " + ("with" if GameManager.current_order_straw else "without") + " a straw, please!"

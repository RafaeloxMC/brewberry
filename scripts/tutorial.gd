extends Control

# fade in?

@onready var label: Label = $Bubble/Label

var hints := [
	"hey, welcome to brewberry!",
	"this is my own little root beer store.",
	"thank you for helping out, i'm really sick at the moment.",
	"let me explain everything quickly:",
	"on the top left, you can see what people order.",
	"of course, they don't repeat themselves forever!",
	"therefore, you can see these three sticky notes to your right.",
	"they show, what the customer wants:",
	"the size of the drink, whether to remove the foam or not,",
	"and if you should add a straw!",
	"start by picking a glass from the shelf. hold it under the tap. important:",
	"there are two red buttons. under no circumstances, press the right one.",
	"the left one dispenses the drink.",
	"what the right one does... just dont press it...",
	"i'd tell you to ask the last brrkeeper but he's not here anymore.",
	"oh well, whatever! if you finished dispensing the drink,",
	"make sure to add the special requirements for the order. if the customer",
	"doesn't want foam, just use the spoon! if they want a straw, add one!",
	"the order doesn't matter here.",
	"your drink won't explode, unlike the machine, right! ha ha ha!",
	"okay, once you are finished, just place the drink in the pickup area",
	"and get your hard-earned cash!"
	]
var i = 0

func _ready() -> void:
	label.text = hints[i]

func _on_gui_input(event: InputEvent) -> void:
	if event.is_action("lmb") && event.is_pressed():
		go_to_next_info()
		
func go_to_next_info() -> void:
	if i >= hints.size() - 1:
		GameManager.current_order_active = true
		GameManager.sell.emit(0)
		self.queue_free()
		return
	i += 1
	label.text = hints[i]
	pass

extends AnimatedSprite2D

# sizes sm, md, lg
@export var size := "sm"

func fill() -> void:
	self.play(size + "_fill")

extends Sprite

export var show_grass = false

func _ready():
	if (!show_grass):
		get_node("grass").hide()
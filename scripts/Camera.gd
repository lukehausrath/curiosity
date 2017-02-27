extends Node2D
# Camera which follows character around the map
# use set_canvas_transform to move the camera
# use set_size_override to adjust the zoom, ignoring x and y and focusing on width and height

func _ready():
	get_viewport().set_canvas_transform(Matrix32(0, Vector2(-100,-210)))

func _process(delta):
	pass
extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	connect("body_enter", self, "_on_eb_body_enter")
	connect("area_enter", self, "_on_eb_body_enter")

func _on_eb_body_enter():
	print("body enter")

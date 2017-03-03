extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	connect("body_enter", self, "_on_eb_body_enter")
	connect("body_exit", self, "_on_eb_body_exit")

func _on_eb_body_enter(body):
	get_parent().emit_signal("queue_music_start", "Eb")
	print("body enter Eb")

func _on_eb_body_exit(body):
	print("body exit Eb")
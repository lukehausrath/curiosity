extends Node2D

func _ready():
	set_process(true)

func on_eb_body_enter():
	print("eb!")
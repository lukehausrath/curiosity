extends Node2D

var bpm = 100.0
var bpmInSeconds = 0.0
var noteDelta = 0.0
var playing = false

var TEMP_X = 1

func count(delta):
	noteDelta += delta
	if (noteDelta >= bpmInSeconds):
		noteDelta = noteDelta - bpmInSeconds
		if (TEMP_X == 1):
			print("tick")
			TEMP_X = 2
		elif (TEMP_X == 2):
			print("tock")
			TEMP_X = 1

func _process(delta):
	if (playing):
		count(delta)

func _on_music_start(id):
	playing = true

func _on_music_stop(id):
	playing = false
	noteDelta = bpmInSeconds

func _ready():
	set_process(true)
	
	bpmInSeconds = 60.0 / bpm
	noteDelta = bpmInSeconds
	
	get_parent().connect("queue_music_start", self, "_on_music_start")
	get_parent().connect("queue_music_stop", self, "_on_music_stop")
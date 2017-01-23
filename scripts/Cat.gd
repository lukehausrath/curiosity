# Script for the main character cat
extends KinematicBody2D

const WALK_SPEED = 50
const GRAVITY_VEC = Vector2(0, 100)

var velocity = Vector2()
var animSprite = null


func _fixed_process(delta):
	if (Input.is_action_pressed("ui_left")):
		velocity.x = -WALK_SPEED
		animSprite.play("default")
		animSprite.set_flip_h(true)
	elif (Input.is_action_pressed("ui_right")):
		velocity.x = WALK_SPEED
		animSprite.play("default")
		animSprite.set_flip_h(false)
	else:
		velocity.x = 0
		animSprite.stop()
	
	var motion = velocity * delta
	move(motion)


func _ready():
	set_fixed_process(true)
	animSprite = get_node("AnimSprite")
	assert(animSprite != null)
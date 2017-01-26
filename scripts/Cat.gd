# Script for the main character cat
extends KinematicBody2D

const WALK_SPEED = 50
const JUMP_VELOCITY = -75
const GRAVITY = 100
const GRAVITY_ACCEL = 9.8

var velocity = Vector2()
var animSprite = null
var on_floor = false


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
	if (Input.is_key_pressed(KEY_SPACE) && on_floor):
		velocity.y = JUMP_VELOCITY
		on_floor = false
	
	velocity.y += GRAVITY * delta
	var motion = velocity * delta
	move(motion)
	
	if (is_colliding()):
		var n = get_collision_normal()
		if (n.y > -1.001 && n.y < -0.999):
			on_floor = true
		else:
			on_floor = false
		motion = n.slide(motion)
		velocity = n.slide(velocity)
		move(motion)
	else:
		on_floor = false


func _ready():
	set_fixed_process(true)
	animSprite = get_node("AnimSprite")
	assert(animSprite != null)
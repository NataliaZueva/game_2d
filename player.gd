extends CharacterBody2D

@onready var buttons = $Steps
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

const cound_walk = "res://audio/шаги.mp3"
const cound_jamp =  "res://audio/прыжок.mp3"

var hp: int = 3

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gold = 0 

@onready var anim = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
		
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		$jamp.play()
		velocity.y = JUMP_VELOCITY
		anim.play("jamp")
		
		
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0: 
			if $Steps/Timer.time_left == 0 and is_on_floor(): 
				$Steps.play()
				$Steps/Timer.start()
			anim.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0:
			anim.play("idle")
		
	if direction == -1: 
		$AnimatedSprite2D.flip_h = true
	elif direction == 1: 
		$AnimatedSprite2D.flip_h = false
		
	if velocity.y > 0: 
		anim.play("fall")
		
	move_and_slide()

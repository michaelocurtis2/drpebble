extends KinematicBody2D

var speed = 60
var jump_speed = 135
var gravity = 250

var facing_left = true
var velocity = Vector2.ZERO


func get_input():
	velocity.x = 0
	
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
		
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed


func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("move_up"):
		if is_on_floor():
			velocity.y = -jump_speed

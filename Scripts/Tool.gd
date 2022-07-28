extends Node2D

onready var raycast = $RayCast2D

var current_block = null
var in_body = false
var updated_angle = false


func _process(_delta):
	input_handler()


func input_handler():
	if Input.is_action_just_released("mine_up"):
		raycast.rotation_degrees = 180
		collision_check()
		
	if Input.is_action_just_released("mine_down"):
		raycast.rotation_degrees = 0
		collision_check()
		
	if Input.is_action_just_released("mine_left"):
		raycast.rotation_degrees = 90
		collision_check()
		
	if Input.is_action_just_released("mine_right"):
		raycast.rotation_degrees = 270
		collision_check()
		

func collision_check():
	raycast.force_raycast_update()
	
	if raycast.is_colliding():
		print(raycast.get_collider())
		
		if raycast.get_collider().mineable == true:
			raycast.get_collider().queue_free()
	else:
		print("Nothing there")


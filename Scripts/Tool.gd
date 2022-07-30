extends Node2D

onready var raycast = $RayCast2D
onready var sprite = $Sprite

var current_block = null
var in_body = false
var updated_angle = false


func _process(_delta):
	input_handler()


func input_handler():
	if Input.is_action_just_released("mine_up"):
		raycast.rotation_degrees = 180
		sprite.rotation_degrees = 270
		collision_check()
		
	if Input.is_action_just_released("mine_down"):
		raycast.rotation_degrees = 0
		sprite.rotation_degrees = 90
		collision_check()
		
	if Input.is_action_just_released("mine_left"):
		raycast.rotation_degrees = 90
		sprite.rotation_degrees = 180
		collision_check()
		
	if Input.is_action_just_released("mine_right"):
		raycast.rotation_degrees = 270
		sprite.rotation_degrees = 0
		collision_check()
		

func collision_check():
	raycast.force_raycast_update()
	var col = raycast.get_collider()
	
	if raycast.is_colliding():
		
		if col.mineable == true:
			#print(col.name)
			
			if col.block_name == "Rock":
				Global.rock += 1
				
			if col.block_name == "Coal":
				Global.coal += 1
				
			if col.block_name == "Diamond":
				Global.diamond += 1
				
			col.queue_free()
	else:
		pass


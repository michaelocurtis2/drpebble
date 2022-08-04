extends Node2D

onready var raycast = $RayCast2D
onready var drill = $Sprite

var current_block = null
var in_body = false
var updated_angle = false



func _process(_delta):
	input_handler()


func input_handler():
	if Input.is_action_just_released("mine_up"):
		raycast.rotation_degrees = 180
		drill.rotation_degrees = 270
		collision_check()
		
	if Input.is_action_just_released("mine_down"):
		raycast.rotation_degrees = 0
		drill.rotation_degrees = 90
		collision_check()
		
	if Input.is_action_just_released("mine_left"):
		raycast.rotation_degrees = 90
		drill.rotation_degrees = 180
		collision_check()
		
	if Input.is_action_just_released("mine_right"):
		raycast.rotation_degrees = 270
		drill.rotation_degrees = 0
		collision_check()
		

func collision_check():
	raycast.force_raycast_update()
	var col = raycast.get_collider()
	
	if raycast.is_colliding():
		
		if col.mineable == true:
			
			# BreakNoise pitch variations
			Global.srng.randomize()
			var ptch = Global.srng.randf_range(col.pitch_range[0], col.pitch_range[1])
			$BreakNoise.pitch_scale = ptch
			$BreakNoise.play()
			
			#print(Global.calculate_pos(col.global_position.y, col.global_position.x))
			
			col.damage_lvl += Global.tool_damage
			
			
			# Damage level management
			if col.damage_lvl >= col.damage_max:
				if col.resource_type == "Rock":
					Global.rock += 1
					
				if col.resource_type == "Coal":
					Global.coal += 1
					
				if col.resource_type == "Diamond":
					Global.diamond += 1
					
				col.queue_free()
				
			else:
				col.manage_damage()
				
				
	else:
		pass


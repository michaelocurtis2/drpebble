extends Node

var rock = 0
var coal = 0
var diamond = 0

var rng = RandomNumberGenerator.new()

func switch_scenes(var next_scene):
	var scene = get_parent().get_node("GameManager/CurrentScene")
	print(scene)
	
	scene.get_child(0).queue_free()
	scene.add_child(load(next_scene).instance())


func set_camera_limits(tilemap, camera):
	var map_limits = tilemap.get_used_rect()
	var map_cellsize = tilemap.cell_size
	
	camera.limit_left = map_limits.position.x * map_cellsize.x
	camera.limit_right = map_limits.end.x * map_cellsize.x
	camera.limit_top = map_limits.position.y * map_cellsize.y
	camera.limit_bottom = map_limits.end.y * map_cellsize.y

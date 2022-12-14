extends Node

var rock = 0
var coal = 0
var diamond = 0

var money = 10

var tool_damage = 1

var rng = RandomNumberGenerator.new()
var srng = RandomNumberGenerator.new()
var world_seed = ""
var display_gameui = false

onready var coal_txt = preload("res://Resources/Textures/Blocks/coal.png")
onready var diam_txt = preload("res://Resources/Textures/Blocks/diamond.png")

func calculate_pos(y_value, x_value):
	return [calculate_pos_y(y_value), calculate_pos_y(x_value)]


func calculate_pos_y(y_value):
	return y_value / 16


func calculate_pos_x(x_value):
	return x_value / 16


func load_data(file):
	var file_path = "res://Data/" + file
	var json_data
	var file_data = File.new()
	file_data.open(file_path, File.READ)
	json_data = JSON.parse(file_data.get_as_text())
	file_data.close()
	return json_data.result	


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

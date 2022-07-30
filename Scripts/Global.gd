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

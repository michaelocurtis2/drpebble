extends Node2D

onready var block = load("res://Scenes/Block.tscn")

export var generating_type = "Rock"
export var x_limit = 20
export var y_limit = 30

var tile_size = 16


var rock_total = 0
var coal_total = 0
var diamond_total = 0

func _ready():
	$Area.visible = false
	generate_tiles()


func generate_tiles():
	var gen_pos = (global_position.y / 16)
	for i in x_limit:
		for j in y_limit:
			var inst = block.instance()
			inst.block_type = generating_type
			inst.position = Vector2(i * tile_size, j * tile_size)
			inst.resource_type = randomise_tile(j + gen_pos)
			inst.update_block()
			add_child(inst)
			
	print("Rock:", rock_total)
	print("Coal:", coal_total)
	print("Diamond:", diamond_total)


func randomise_tile(var depth):
	#print(depth)
	#Global.rng.randomize()
	var chance = Global.rng.randf_range(0.0, 1.0)
	
	var depth_chance = depth * 0.07
	
	if chance < (depth_chance * 0.02) and (depth > 22):
		#print("Diamond")
		diamond_total += 1
		return "Diamond"
		
	if chance < (depth_chance * 0.14):
		#print("Coal")
		coal_total += 1
		return "Coal"
		
	elif chance < 1.0:
		#print("Rock")
		rock_total += 1
		return "Rock"
		
	

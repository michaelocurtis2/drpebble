extends Node2D

onready var block = load("res://Scenes/Block.tscn")

var tile_size = 16

var x_limit = 20
var y_limit = 30

var rock_total = 0
var coal_total = 0
var diamond_total = 0

func _ready():
	$Area.visible = false
	generate_tiles()


func generate_tiles():
	for i in x_limit:
		for j in y_limit:
			var inst = block.instance()
			inst.type = randomise_tile()
			inst.update_block()
			inst.position = Vector2(i * tile_size, j * tile_size)
			add_child(inst)
			
	print("Rock:", rock_total)
	print("Coal:", coal_total)
	print("Diamond:", diamond_total)


func randomise_tile():
	Global.rng.randomize()
	var chance = Global.rng.randf_range(0.0, 1.0)
	
	if chance < 0.05:
		#print("Diamond")
		diamond_total += 1
		return 2
		
	if chance < 0.2:
		#print("Coal")
		coal_total += 1
		return 1
		
	elif chance < 1.0:
		#print("Rock")
		rock_total += 1
		return 0
		
	

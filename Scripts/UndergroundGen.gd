extends Node2D

onready var block = load("res://Scenes/Block.tscn")

var tile_size = 16

var h_limit = 16
var v_limit = 9

func _ready():
	generate_tiles()


func generate_tiles():
	for i in h_limit:
		for j in v_limit:
			var inst = block.instance()
			inst.position = Vector2(i * tile_size, j * tile_size)
			add_child(inst)

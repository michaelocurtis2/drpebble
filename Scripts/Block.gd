extends Node2D

var block_name = "Rock"
var type = 0

var mineable = true


func _ready():
	update_block()


func update_block():
	if type == 0:
		block_name = "Rock"
		
	if type == 1:
		block_name = "Coal"
		
	if type == 2:
		block_name = "Diamond"
	
	$Sprite.texture = load("res://Resources/Textures/Blocks/"+block_name.to_lower()+".png")

extends Control


func _process(_delta):
	$WorldInfo/Seed.text = str(Global.world_seed)

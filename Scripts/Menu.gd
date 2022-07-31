extends Node2D

func _on_SeedSubmit_pressed():
	var text = $UI/SeedText.text
	
	if text == "":
		var srng = RandomNumberGenerator.new()
		srng.randomize()
		text = srng.randi()
	
	Global.rng.set_seed(int(text))
	Global.world_seed = text
	
	Global.switch_scenes("res://Scenes/InitialArea.tscn")

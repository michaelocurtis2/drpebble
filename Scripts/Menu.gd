extends Node2D

func _on_SeedSubmit_pressed():
	Global.rng.set_seed(int($UI/SeedText.text))
	
	Global.switch_scenes("res://Scenes/InitialArea.tscn")

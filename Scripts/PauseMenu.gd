extends Control

var is_paused = false setget set_is_paused
#var seed_displayed = false


func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		self.is_paused = !is_paused
		
	$WorldInfo/Seed.text = str(Global.world_seed)


func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused


func _on_Resume_pressed():
	self.is_paused = false


func _on_Quit_pressed():
	get_tree().quit()


func _on_ViewSeed_pressed():
	$WorldInfo.visible = !$WorldInfo.visible

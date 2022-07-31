extends Node2D


func _process(_delta):
	if Global.display_gameui == true:
		$GUI/GameUI.visible = true
		
	if Global.display_gameui == false:
		$GUI/GameUI.visible = false

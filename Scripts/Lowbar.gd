extends Control

var is_cheating = false setget set_is_cheating


func _process(_delta):
	if Input.is_action_just_pressed("cheat"):
		self.is_cheating = !is_cheating


func set_is_cheating(value):
	is_cheating = value
	visible = is_cheating


func _on_Button_pressed():
	Global.tool_damage = 8

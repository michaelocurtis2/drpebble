extends Node2D

func _process(_delta):
	if Input.is_action_just_pressed("teleport"):
		var player = get_parent().get_node("Player")
		
		player.position = self.global_position

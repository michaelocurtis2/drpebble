extends Node2D

func _ready():
	Global.set_camera_limits($TileMap, $Camera2D)

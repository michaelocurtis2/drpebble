extends Node2D

var block_name = "Rock"
var type = 0

var damage_lvl = 0
var damage_max = 2

var timer_on = false
var repair_delay = 5

var mineable = true


func _ready():
	$DamageTimer.wait_time = repair_delay
	update_block()
	

func _process(_delta):
	manage_damage()
	$Damage.frame = damage_lvl


func update_block():
	if type == 0:
		block_name = "Rock"
		
	if type == 1:
		block_name = "Coal"
		
	if type == 2:
		block_name = "Diamond"
		
	#var angle = Global.rng.randi_range(0, 3)
	#$Sprite.rotation_degrees = 90 * angle
	
	$Sprite.texture = load("res://Resources/Textures/Blocks/"+block_name.to_lower()+".png")


func manage_damage():
	if (damage_lvl != 0) and (timer_on == false):
		$DamageTimer.start()
		timer_on = true


func _on_DamageTimer_timeout():
	damage_lvl -= 1
	timer_on = false

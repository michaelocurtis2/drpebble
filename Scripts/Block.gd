extends Node2D

onready var rock_txt = preload("res://Resources/Textures/Blocks/rock_variants.png")
onready var hrdr_txt = preload("res://Resources/Textures/Blocks/hard_rock_variants.png")

var timer_on = false
var mineable = true
var damage_lvl = 0
var block_type = "Rock"
var resource_type = "Rock"

# changed variables
var pitch_range = [0.8, 1.0]
var damage_max = 3 #hits from 1, 2, 3
var repair_time = 5


func _ready():
	update_variables()
	update_block()


func update_variables():
	var data = Global.load_data(block_type.to_lower() + ".json")
	
	damage_max = data["damage_max"]
	repair_time = data["repair_time"]
	pitch_range = data["pitch_range"]
	
	$DamageTimer.wait_time = repair_time


func update_block():
	#change block
	if block_type == "Rock":
		$Base.texture = rock_txt
		$Base.hframes = 4
		$Base.frame = Global.srng.randi_range(0, 3)
		
	if block_type == "Hard Rock":
		$Base.texture = hrdr_txt
		$Base.hframes = 4
		$Base.frame = Global.srng.randi_range(0, 3)

	#change resource
	if resource_type == "Rock":
		pass
		
	if resource_type == "Coal":
		$Resource.texture = Global.coal_txt
		
	if resource_type == "Diamond":
		$Resource.texture = Global.diam_txt
		
	


func manage_damage():
	var damage_per = damage_lvl / damage_max
	
	if damage_per >= 0:
		$Damage.frame = 0
		
	if damage_per >= 0.25:
		$Damage.frame = 1
		
	if damage_per >= 0.50:
		$Damage.frame = 2
		
	if damage_per >= 0.75:
		$Damage.frame = 3
	
	if (damage_lvl != 0) and (timer_on == false):
		$DamageTimer.start()
		timer_on = true


func _on_DamageTimer_timeout():
	damage_lvl -= 1
	timer_on = false

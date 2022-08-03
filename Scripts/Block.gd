extends Node2D

var block_name = "Rock"
var type = 0

onready var rock_txt = preload("res://Resources/Textures/Blocks/rock_variants.png")
onready var coal_txt = preload("res://Resources/Textures/Blocks/coal.png")
onready var diam_txt = preload("res://Resources/Textures/Blocks/diamond.png")

var damage_lvl = 0
var damage_max = 2

var timer_on = false
var repair_delay = 5

var mineable = true


func _ready():
	$DamageTimer.wait_time = repair_delay
	update_block()
	

func _process(_delta):
	$Damage.frame = damage_lvl


func update_block():
	#$Base.texture = load("res://Resources/Textures/Blocks/rock.png")
	$Base.texture = rock_txt
	$Base.hframes = 4
	$Base.frame = Global.srng.randi_range(0, 3)
	
	if type == 0:
		block_name = "Rock"
		$Resource.visible = false

	if type == 1:
		block_name = "Coal"
		$Resource.texture = coal_txt
		
	if type == 2:
		block_name = "Diamond"
		$Resource.texture = diam_txt
		
	#var angle = Global.rng.randi_range(0, 3)
	#$Sprite.rotation_degrees = 90 * angle


func manage_damage():
	if (damage_lvl != 0) and (timer_on == false):
		$DamageTimer.start()
		timer_on = true


func _on_DamageTimer_timeout():
	damage_lvl -= 1
	timer_on = false

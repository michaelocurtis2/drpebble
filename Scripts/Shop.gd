extends Node2D

var price_rock = 1
var price_coal = 5
var price_diamond = 50

var can_sell = false


func _process(delta):
	if can_sell == true:
		if Input.is_action_just_released("sell"):
			Global.money += Global.rock * price_rock
			Global.money += Global.coal * price_coal
			Global.money += Global.diamond * price_diamond
			
			Global.rock = 0
			Global.coal = 0
			Global.diamond = 0


func _on_SellArea_body_entered(body):
	if body.name == "Player":
		can_sell = true


func _on_SellArea_body_exited(body):
	if body.name == "Player":
		can_sell = false

extends Node2D

var price_rock = 1
var price_coal = 8
var price_diamond = 80

var can_sell = false


func _process(_delta):
	if can_sell == true:
		if Input.is_action_just_released("sell"):
			add_money(Global.rock, price_rock)
			add_money(Global.coal, price_coal)
			add_money(Global.diamond, price_diamond)
			
			Global.rock = 0
			Global.coal = 0
			Global.diamond = 0

func add_money(item, price):
	Global.money += item * price


func _on_SellArea_body_entered(body):
	if body.name == "Player":
		can_sell = true


func _on_SellArea_body_exited(body):
	if body.name == "Player":
		can_sell = false

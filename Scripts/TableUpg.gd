extends Node2D

var tier1 = [150, false, 2]
var tier2 = [800, false, 4]

var can_buy = false

func _process(_delta):
	if can_buy == true:
		
		if tier1[1] == false:
			$Text/Name.text = "Steel Drill"
			$Text/Price.text = "$" + str(tier1[0])
			$Item.frame = 0
			
			var text_color = Color(0,0,0)
			if (Global.money - tier1[0]) < 0:
				text_color = Color(255,0,0)
			else:
				text_color = Color(255,255,255)
			
			$Text/Price.add_color_override("font_color", text_color)
					
			if Input.is_action_just_released("sell"):
				if (Global.money - tier1[0] >= 0):
					Global.money -= tier1[0]
					Global.tool_damage = tier1[2]
					tier1[1] = true
			
		elif (tier1[1] == true) and (tier2[1] == false):
			$Text/Name.text = "Diamond Drill"
			$Text/Price.text = "$" + str(tier2[0])
			$Item.frame = 1
				
			var text_color = Color(0,0,0)
			if (Global.money - tier1[0]) < 0:
				text_color = Color(255,0,0)
			else:
				text_color = Color(255,255,255)
			
			$Text/Price.add_color_override("font_color", text_color)
			
			if Input.is_action_just_released("sell"):
				if (Global.money - tier2[0] >= 0):
					Global.money -= tier2[0]
					Global.tool_damage = tier2[2]
					tier2[1] = true
			
		else:
			$Text/Name.text = "Sold out!"
			$Text/Price.text = "$N/A"
			$Item.frame = 2
			
		



func _on_BuyArea_body_entered(body):
	if body.name == "Player":
		$Text.visible = true
		can_buy = true


func _on_BuyArea_body_exited(body):
	if body.name == "Player":
		$Text.visible = false
		can_buy = false

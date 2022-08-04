extends Control


func _process(_delta):
	$TB_Rock/Label.text = str(Global.rock)
	$TB_Coal/Label.text = str(Global.coal)
	$TB_Diamond/Label.text = str(Global.diamond)
	
	$BalanceDisplay/Money.text = str("$" + str(Global.money))
	$DrillDisplay/Damage.text = str(Global.tool_damage)

extends Control


func _process(delta):
	$TB_Rock/Label.text = str(Global.rock)
	$TB_Coal/Label.text = str(Global.coal)
	$TB_Diamond/Label.text = str(Global.diamond)

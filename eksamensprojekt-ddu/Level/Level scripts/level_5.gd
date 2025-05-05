extends Node

func levelcomplete():
	if Global.level < 5:
		Global.money += 10 
		Global.level = 5
	else:
		Global.money += 5

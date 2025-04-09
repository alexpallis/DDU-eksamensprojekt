extends Node

func levelcomplete():
	if Global.level < 2:
		Global.money += 10 
		Global.level = 2
	else:
		Global.money += 5

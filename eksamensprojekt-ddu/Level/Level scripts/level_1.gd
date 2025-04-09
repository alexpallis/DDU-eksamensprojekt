extends Node

func levelcomplete():
	if Global.level < 1:
		Global.money += 10 
		Global.level = 1
	else:
		Global.money += 5

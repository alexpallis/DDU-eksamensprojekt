extends Node

func levelcomplete():
	if Global.level < 3 and Global.enemy_difficulty == 1 :
		Global.money += 30 
		Global.level = 3
	if Global.level < 3 + 7 and Global.enemy_difficulty == 1.2:
		Global.money += 30 
		Global.level = 3 + 7
	if Global.level < 3 + 7*2 and Global.enemy_difficulty == 1.4:
		Global.money += 30 
		Global.level = 3 + 7 * 2
	if Global.level < 3 + 7*3 and Global.enemy_difficulty == 1.6:
		Global.money += 30 
		Global.level = 3 + 7*3
	if Global.level < 3 + 7*4 and Global.enemy_difficulty == 1.8:
		Global.money += 30 
		Global.level = 3 + 7*3
	else:
		Global.money += 10
	get_tree().change_scene_to_file("res://Scenes/win_scenes.tscn")

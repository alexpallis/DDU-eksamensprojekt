extends Node

@export var level = 0

func levelcomplete():
	if Global.level < level:
		Global.money += 30 
		Global.level = level
	else:
		Global.money += 10
	get_tree().change_scene_to_file("res://Scenes/win_scenes.tscn")

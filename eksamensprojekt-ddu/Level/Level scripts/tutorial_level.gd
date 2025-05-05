extends Node

func levelcomplete():
	get_tree().change_scene_to_file("res://Scenes/Settings.tscn")
	Global.Tutor = false

func _on_back_butten_pressed():
	get_tree().change_scene_to_file("res://Scenes/Settings.tscn")
	Global.Tutor = false

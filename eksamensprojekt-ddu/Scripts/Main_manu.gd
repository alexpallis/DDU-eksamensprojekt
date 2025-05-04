extends Control



func _on_Start_game_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Second_menu.tscn")


func _on_Settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Settings.tscn")




func _on_Exit_pressed() -> void:
	get_tree().quit()

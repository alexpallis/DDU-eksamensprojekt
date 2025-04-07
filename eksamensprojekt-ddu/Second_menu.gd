extends Control


func _on_button_select_level_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")



func _on_button_inventory_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/inventory.tscn")



func _on_button_gacha_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Gacha.tscn")



func _on_button_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main_menu.tscn")

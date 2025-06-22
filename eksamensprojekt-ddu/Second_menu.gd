extends Control


func _on_button_select_level_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_select.tscn")



func _on_button_inventory_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/inventory.tscn")
	Global.Coin  = 10000000000


func _on_button_gacha_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Gacha.tscn")



func _on_button_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

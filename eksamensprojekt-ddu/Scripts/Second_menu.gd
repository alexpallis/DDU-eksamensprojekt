extends Control

@onready var money = $Panel/Money


func _on_button_select_level_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_select.tscn")



func _on_button_inventory_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/inventory.tscn")
	Global.Coin  = 10000000000
	Global.get_unit()


func _on_button_gacha_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Gacha.tscn")



func _on_button_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _ready():
	if Global.money == 0:
		money.text = "You are broke"
	else:
		money.text ="You have " + str(Global.money) + " Yudos"

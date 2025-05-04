extends Node

@onready var money = $Panel/money


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_select.tscn")

func _ready():
	if Global.money == 0:
		money.text = "You are broke"
	else:
		money.text ="You have " + str(Global.money) + " Yudos"

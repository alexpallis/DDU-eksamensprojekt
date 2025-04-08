extends Node

@onready var money = $Panel/Mony


func _on_day_1_pressed():
	Global.Coin = 0
	Global.CoinSpeed = Global.StandardCoinSpeed
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_day_2_pressed():
	Global.Coin = 0
	Global.CoinSpeed = Global.StandardCoinSpeed
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_day_3_pressed():
	Global.Coin = 0
	Global.CoinSpeed = Global.StandardCoinSpeed
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_day_4_pressed():
	Global.Coin = 0
	Global.CoinSpeed = Global.StandardCoinSpeed
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/Second_menu.tscn")

func _ready():
	money.text ="You have " + str(Global.money) + " Yudos"

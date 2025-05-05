extends Node

@onready var money = $Panel/Mony
@onready var stage_guid = $"Panel/Stage guid"


func _on_day_1_pressed():
	Global.Coin = 0
	Global.CoinSpeed = Global.StandardCoinSpeed
	get_tree().change_scene_to_file("res://Level/Levels/level_1.tscn")


func _on_day_2_pressed():
	if Global.level >= 1:
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_2.tscn")
	else:
		stage_guid.text = "You need to complete day 1 fist"


func _on_day_3_pressed():
	if Global.level >= 2:
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_3.tscn")
	else:
		stage_guid.text = "You need to complete day 2 fist"

func _on_day_4_pressed():
	if Global.level >= 3:
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_3.tscn")
	else:
		stage_guid.text = "You need to complete day 3 fist"





func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/Second_menu.tscn")

func _ready():
	if Global.money == 0:
		money.text = "You are broke"
	else:
		money.text ="You have " + str(Global.money) + " Yudos"

func _on_day_0_pressed():
	Global.Coin = 0
	Global.CoinSpeed = 25

func _on_day_minus_1_pressed():
	Global.Coin = 0
	Global.CoinSpeed = Global.StandardCoinSpeed
	Global.handdave1 = 9
	Global.handdave2 = 10
	Global.handdave3 = 6
	Global.handdave4 = 6
	Global.handdave5 = 6
	Global.handdave6 = 6
	Global.handdave7 = 6
	Global.handdave8 = 6
	Global.handdave9 = 6
	Global.handdave10 = 6

func _on_day_minus_2_pressed():
	Global.enemy_difficulty = 2
	Global.Coin = 0
	Global.CoinSpeed = 10
	


func _on_day_5_pressed():
	pass # Replace with function body.


func _on_day_6_pressed():
	pass # Replace with function body.


func _on_day_7_pressed():
	pass # Replace with function body.


func _on_day_8_pressed():
	pass # Replace with function body.


func _on_day_9_pressed():
	pass # Replace with function body.


func _on_day_10_pressed():
	pass # Replace with function body.


func _on_day_11_pressed():
	pass # Replace with function body.


func _on_day_12_pressed():
	pass # Replace with function body.


func _on_day_13_pressed():
	pass # Replace with function body.


func _on_day_14_pressed():
	pass # Replace with function body.


func _on_day_15_pressed():
	pass # Replace with function body.


func _on_day_16_pressed():
	pass # Replace with function body.


func _on_day_17_pressed():
	pass # Replace with function body.


func _on_day_18_pressed():
	pass # Replace with function body.


func _on_day_19_pressed():
	pass # Replace with function body.


func _on_day_20_pressed():
	pass # Replace with function body.


func _on_day_21_pressed():
	pass # Replace with function body.


func _on_day_22_pressed():
	pass # Replace with function body.


func _on_day_23_pressed():
	pass # Replace with function body.


func _on_day_24_pressed():
	pass # Replace with function body.


func _on_day_25_pressed():
	pass # Replace with function body.


func _on_day_26_pressed():
	pass # Replace with function body.


func _on_day_27_pressed():
	pass # Replace with function body.


func _on_day_28_pressed():
	pass # Replace with function body.


func _on_day_29_pressed():
	pass # Replace with function body.


func _on_day_30_pressed():
	pass # Replace with function body.


func _on_day_31_pressed():
	pass # Replace with function body.


func _on_dayplus_1_pressed():
	pass # Replace with function body.

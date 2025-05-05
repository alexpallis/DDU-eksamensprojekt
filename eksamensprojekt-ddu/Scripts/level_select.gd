extends Node

@onready var money = $Panel/Mony
@onready var stage_guid = $"Panel/Stage guid"


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/Second_menu.tscn")

func _ready():
	if Global.money == 0:
		money.text = "You are broke"
	else:
		money.text ="You have " + str(Global.money) + " Yudos"

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
		get_tree().change_scene_to_file("res://Level/Levels/level_4.tscn")
	else:
		stage_guid.text = "You need to complete day 3 fist"

func _on_day_5_pressed():
	if Global.level >= 4:
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_5.tscn")
	else:
		stage_guid.text = "You need to complete day 4 fist"

func _on_day_6_pressed():
	if Global.level >= 5:
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_6.tscn")
	else:
		stage_guid.text = "You need to complete day 5 fist"

func _on_day_7_pressed():
	if Global.level >= 6:
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_7.tscn")
	else:
		stage_guid.text = "You need to complete day 6 fist"

func _on_day_8_pressed():
	if Global.level >= 7:
		Global.enemy_difficulty = 1.2
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_1.tscn")
	else:
		stage_guid.text = "You need to complete day 7 fist"

func _on_day_9_pressed():
	if Global.level >= 8:
		Global.enemy_difficulty = 1.2
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_2.tscn")
	else:
		stage_guid.text = "You need to complete day 8 fist"

func _on_day_10_pressed():
	if Global.level >= 9:
		Global.enemy_difficulty = 1.2
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_3.tscn")
	else:
		stage_guid.text = "You need to complete day 9 fist"

func _on_day_11_pressed():
	if Global.level >= 10:
		Global.enemy_difficulty = 1.2
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_4.tscn")
	else:
		stage_guid.text = "You need to complete day 10 fist"

func _on_day_12_pressed():
	if Global.level >= 11:
		Global.enemy_difficulty = 1.2
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_5.tscn")
	else:
		stage_guid.text = "You need to complete day 11 fist"

func _on_day_13_pressed():
	if Global.level >= 12:
		Global.enemy_difficulty = 1.2
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_6.tscn")
	else:
		stage_guid.text = "You need to complete day 12 fist"

func _on_day_14_pressed():
	if Global.level >= 13:
		Global.enemy_difficulty = 1.2
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_7.tscn")
	else:
		stage_guid.text = "You need to complete day 13 fist"

func _on_day_15_pressed():
	if Global.level >= 14:
		Global.enemy_difficulty = 1.4
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_1.tscn")
	else:
		stage_guid.text = "You need to complete day 14 fist"

func _on_day_16_pressed():
	if Global.level >= 15:
		Global.enemy_difficulty = 1.4
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_2.tscn")
	else:
		stage_guid.text = "You need to complete day 15 fist"
func _on_day_17_pressed():
	if Global.level >= 16:
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_3.tscn")
	else:
		stage_guid.text = "You need to complete day 16 fist"

func _on_day_18_pressed():
	if Global.level >= 17:
		Global.enemy_difficulty = 1.4
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_4.tscn")
	else:
		stage_guid.text = "You need to complete day 17 fist"

func _on_day_19_pressed():
	if Global.level >= 18:
		Global.enemy_difficulty = 1.4
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_5.tscn")
	else:
		stage_guid.text = "You need to complete day 18 fist"

func _on_day_20_pressed():
	if Global.level >= 19:
		Global.enemy_difficulty = 1.4
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_6.tscn")
	else:
		stage_guid.text = "You need to complete day 19 fist"

func _on_day_21_pressed():
	if Global.level >= 20:
		Global.enemy_difficulty = 1.4
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_7.tscn")
	else:
		stage_guid.text = "You need to complete day 20 fist"

func _on_day_22_pressed():
	if Global.level >= 21:
		Global.enemy_difficulty = 1.6
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_1.tscn")
	else:
		stage_guid.text = "You need to complete day 21 fist"

func _on_day_23_pressed():
	if Global.level >= 22:
		Global.enemy_difficulty = 1.6
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_2.tscn")
	else:
		stage_guid.text = "You need to complete day 22 fist"

func _on_day_24_pressed():
	if Global.level >= 23:
		Global.enemy_difficulty = 1.6
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_3.tscn")
	else:
		stage_guid.text = "You need to complete day 23 fist"

func _on_day_25_pressed():
	if Global.level >= 24:
		Global.enemy_difficulty = 1.6
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_4.tscn")
	else:
		stage_guid.text = "You need to complete day 24 fist"

func _on_day_26_pressed():
	if Global.level >= 25:
		Global.enemy_difficulty = 1.6
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_5.tscn")
	else:
		stage_guid.text = "You need to complete day 25 fist"

func _on_day_27_pressed():
	if Global.level >= 26:
		Global.enemy_difficulty = 1.6
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_6.tscn")
	else:
		stage_guid.text = "You need to complete day 26 fist"

func _on_day_28_pressed():
	if Global.level >= 27:
		Global.enemy_difficulty = 1.6
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_7.tscn")
	else:
		stage_guid.text = "You need to complete day 27 fist"

func _on_day_29_pressed():
	if Global.level >= 28:
		Global.enemy_difficulty = 1.8
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_1.tscn")
	else:
		stage_guid.text = "You need to complete day 28 fist"

func _on_day_30_pressed():
	if Global.level >= 29:
		Global.enemy_difficulty = 1.8
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_2tscn")
	else:
		stage_guid.text = "You need to complete day 29 fist"

func _on_day_31_pressed():
	if Global.level >= 30:
		Global.enemy_difficulty = 1.8
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_3.tscn")
	else:
		stage_guid.text = "You need to complete day 30 fist"

func _on_dayplus_1_pressed():
	if Global.level >= 31:
		Global.enemy_difficulty = 2
		Global.Coin = 0
		Global.CoinSpeed = Global.StandardCoinSpeed
		get_tree().change_scene_to_file("res://Level/Levels/level_4.tscn")
	else:
		stage_guid.text = "You need to complete every day fist"


func _on_day_0_pressed():
	Global.Coin = 0
	Global.CoinSpeed = 25
	get_tree().change_scene_to_file("res://Level/Levels/level_5.tscn")

func _on_day_minus_1_pressed():
	#kan også godt give en random hånd
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
	get_tree().change_scene_to_file("res://Level/Levels/level_4.tscn")

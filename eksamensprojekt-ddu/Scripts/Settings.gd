extends Control

@onready var audio_stream_player_2d = $AudioStreamPlayer2D

var play = false

func _on_button_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main_menu.tscn")



func _on_test_sound_pressed():
	audio_stream_player_2d.play()


func _on_turorial_pressed():
	Global.Tutor = true
	Global.Coin = 50
	Global.CoinSpeed = Global.StandardCoinSpeed * 2
	Global.handdave1 = 0
	Global.handdave2 = 1
	Global.handdave3 = 2
	Global.handdave4 = -1
	Global.handdave5 = -1
	Global.handdave6 = -1
	Global.handdave7 = -1
	Global.handdave8 = -1
	Global.handdave9 = -1
	Global.handdave10 = -1
	get_tree().change_scene_to_file("res://Level/Levels/tutorial_level.tscn")


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")

extends Control






func _on_hand_1_mouse_entered():
	Global.Hand1MouseOn = true

func _on_hand_1_mouse_exited():
	Global.Hand1MouseOn = false


func _on_hand_2_mouse_entered():
	Global.Hand2MouseOn = true


func _on_hand_2_mouse_exited():
	Global.Hand2MouseOn = false
	

func _on_hand_3_mouse_entered():
	Global.Hand3MouseOn = true


func _on_hand_3_mouse_exited():
	Global.Hand3MouseOn = false


func _on_hand_4_mouse_entered():
	Global.Hand4MouseOn = true


func _on_hand_4_mouse_exited():
	Global.Hand4MouseOn = false


func _on_hand_5_mouse_entered():
	Global.Hand5MouseOn = true


func _on_hand_5_mouse_exited():
	Global.Hand5MouseOn = false


func _on_hand_6_mouse_entered():
	Global.Hand6MouseOn = true


func _on_hand_6_mouse_exited():
	Global.Hand6MouseOn = false


func _on_hand_7_mouse_entered():
	Global.Hand7MouseOn = true


func _on_hand_7_mouse_exited():
	Global.Hand7MouseOn = false


func _on_hand_8_mouse_entered():
	Global.Hand8MouseOn = true


func _on_hand_8_mouse_exited():
	Global.Hand8MouseOn = false


func _on_hand_9_mouse_entered():
	Global.Hand9MouseOn = true


func _on_hand_9_mouse_exited():
	Global.Hand9MouseOn = false


func _on_hand_10_mouse_entered():
	Global.Hand10MouseOn = true


func _on_hand_10_mouse_exited():
	Global.Hand10MouseOn = false


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Second_menu.tscn")

extends Area2D


func _on_area_exited(area):
	Global.Layer1hovering = false


func _on_area_entered(area):
	Global.Layer1hovering = true

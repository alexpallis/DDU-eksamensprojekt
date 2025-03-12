extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_layer_1_area_area_entered(area):
	Global.Layer1hovering = true
	

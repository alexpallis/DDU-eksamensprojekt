extends Sprite2D

func _ready():
	set_property("2")

func set_property(ID = "0"):
	texture = load("res://assets/" + ItemD.get_texture_name(ID))

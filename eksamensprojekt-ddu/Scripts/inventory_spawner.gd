extends Control

var dave_types = [
	preload("res://Scenes/dave.tscn"),
	preload("res://Scenes/dave_legs.tscn"),
	preload("res://Scenes/dave_arms.tscn"),
	preload("res://Scenes/dave_thief.tscn"),
	preload("res://Scenes/dave_bomb.tscn"),
	preload("res://Scenes/wizard_dave.tscn"),
	preload("res://Scenes/dave_grill.tscn"),
	preload("res://Scenes/dave_ninja.tscn"),
	preload("res://Scenes/dave_gun.tscn"),  
	preload("res://Scenes/dave_saiyan.tscn"),
	preload("res://Scenes/dave_pearl.tscn"),
	preload("res://Scenes/dave_ninja_thief.tscn"),
	preload("res://Scenes/dave_charge.tscn"),
]
var positions = [
	Vector2(100, 50), 
	Vector2(200, 50),  
	Vector2(300, 50),  
	Vector2(400, 50), 
	Vector2(500, 50),  
	Vector2(600, 50),
	Vector2(700, 50),
	Vector2(800, 50),
	Vector2(900, 50),
	Vector2(1000, 50),
	Vector2(100, 150), 
	Vector2(200, 150),  
	Vector2(300, 150),  
	Vector2(400, 150), 
	Vector2(500, 150),  
	Vector2(600, 150),
	Vector2(700, 150),
	Vector2(800, 150),
	Vector2(900, 150),
	Vector2(1000, 150),
]
var handplacement = [ 
	[0,Global.Dave,0],
	[1,Global.D1,1],
	[2,Global.D2,2],
	[3,Global.D3,3],
	[4,Global.D4,4],
	[5,Global.D5,5],
	[6,Global.D6,6],
	[7,Global.D7,7],
	[8,Global.D8,8],
	[9,Global.D9,9],
	[10,Global.D10,10],
	[11,Global.D11,11],
	[12,Global.D12,12],
	[13,Global.D13,13],
	[14,Global.D14,14],
	[15,Global.D15,15],
	[16,Global.D16,16],
	[17,Global.D17,17],
	[18,Global.D18,18],
	[19,Global.D19,19],
]
func _ready():
	spawnonboard()

func spawnonboard():
	for data in handplacement:
			var type_index = data[0]
			var position_index = data[2]
			var amount_index = data[1] 
			spawn_dave(type_index, position_index, amount_index)
	
func spawn_dave(type_index: int, position_index: int, amount_index: int):
	if type_index < 0 or type_index >= dave_types.size():
		push_error("Invalid enemy type index: %d" % type_index)
		return
	if position_index < 0 or position_index >= positions.size():
		push_error("Invalid lane index: %d" % position_index)
		return
	if amount_index >= 1:
		var dave_scene = dave_types[type_index]
		var dave_instance = dave_scene.instantiate()
		add_child(dave_instance)
		dave_instance.position = positions[position_index]
		print("hey")

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
	Vector2(200, 550), 
	Vector2(285, 550),  
	Vector2(370, 550),  
	Vector2(455, 550), 
	Vector2(520, 550),  
	Vector2(625, 550),
	Vector2(710, 550),
	Vector2(795, 550),
	Vector2(880, 550),
	Vector2(965, 550),
]
var handplacement = [ 
	[Global.handdave1,Global.handdave1cd,0],
	[Global.handdave2,Global.handdave2cd,1],
	[Global.handdave3,Global.handdave3cd,2],
	[Global.handdave4,Global.handdave4cd,3],
	[Global.handdave5,Global.handdave5cd,4],
	[Global.handdave6,Global.handdave6cd,5],
	[Global.handdave7,Global.handdave7cd,6],
	[Global.handdave8,Global.handdave8cd,7],
	[Global.handdave9,Global.handdave9cd,8],
	[Global.handdave10,Global.handdave10cd,9],
]
func _ready():
	spawnonboard()

func spawnonboard():
	for data in handplacement:
			var type_index = data[0]
			var position_index = data[2]
			spawn_dave(type_index, position_index)
	
func spawn_dave(type_index: int, position_index: int):
	if type_index < 0 or type_index >= dave_types.size():
		push_error("Invalid enemy type index: %d" % type_index)
		return
	if position_index < 0 or position_index >= positions.size():
		push_error("Invalid lane index: %d" % position_index)
		return

	var dave_scene = dave_types[type_index]
	var dave_instance = dave_scene.instantiate()
	add_child(dave_instance)

	dave_instance.position = positions[position_index]
func _physics_process(delta):
	if Global.handdave1cdstart == true:
		Global.handdave1cdstart = false
		await get_tree().create_timer(Global.handdave1cd).timeout
		spawn_dave(Global.handdave1,0)
	if Global.handdave2cdstart == true:
		Global.handdave2cdstart = false
		await get_tree().create_timer(Global.handdave2cd).timeout
		spawn_dave(Global.handdave2,1)
	if Global.handdave3cdstart == true:
		Global.handdave3cdstart = false
		await get_tree().create_timer(Global.handdave3cd).timeout
		spawn_dave(Global.handdave3,2)
	if Global.handdave4cdstart == true:
		Global.handdave4cdstart = false
		await get_tree().create_timer(Global.handdave4cd).timeout
		spawn_dave(Global.handdave4,3)
	if Global.handdave5cdstart == true:
		Global.handdave5cdstart = false
		await get_tree().create_timer(Global.handdave5cd).timeout
		spawn_dave(Global.handdave5,4)
	if Global.handdave6cdstart == true:
		Global.handdave6cdstart = false
		await get_tree().create_timer(Global.handdave6cd).timeout
		spawn_dave(Global.handdave6,5)
	if Global.handdave7cdstart == true:
		Global.handdave7cdstart = false
		await get_tree().create_timer(Global.handdave7cd).timeout
		spawn_dave(Global.handdave7,6)
	if Global.handdave8cdstart == true:
		Global.handdave8cdstart = false
		await get_tree().create_timer(Global.handdave8cd).timeout
		spawn_dave(Global.handdave8,7)
	if Global.handdave9cdstart == true:
		Global.handdave9cdstart = false
		await get_tree().create_timer(Global.handdave9cd).timeout
		spawn_dave(Global.handdave9,8)
	if Global.handdave10cdstart == true:
		Global.handdave10cdstart = false
		await get_tree().create_timer(Global.handdave10cd).timeout
		spawn_dave(Global.handdave10,9)

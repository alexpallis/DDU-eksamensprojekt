extends Control

var dave_types = [
	preload("res://Scenes/unit.tscn"),
	preload("res://Scenes/dave_legs.tscn"),
	preload("res://Scenes/dave_arms.tscn"),
	preload("res://Scenes/dave_thief.tscn"),
	preload("res://Scenes/dave_bomb.tscn")  
]
var positions = [
	Vector2(200, 550), 
	Vector2(300, 550),  
	Vector2(400, 550),  
	Vector2(500, 550), 
	Vector2(600, 550),  
	Vector2(700, 550),
]
var handplacement = [ 
	[Global.handdave1,Global.handdave1cd,0],
	[Global.handdave2,Global.handdave2cd,1],
	[Global.handdave3,Global.handdave3cd,2],
	[Global.handdave4,Global.handdave4cd,3],
	[Global.handdave5,Global.handdave5cd,4],
	[Global.handdave6,Global.handdave6cd,5]
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

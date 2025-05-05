extends Control

var dave_types = Global.daves

var positions = [
	Vector2(200, 550), Vector2(285, 550), Vector2(370, 550),
	Vector2(455, 550), Vector2(520, 550), Vector2(625, 550),
	Vector2(710, 550), Vector2(795, 550), Vector2(880, 550),
	Vector2(965, 550),
]

# Store hand info as dictionaries for clarity
var handplacement = [
	{"type": Global.handdave1, "cd": Global.handdave1cd, "cd_start": "handdave1cdstart", "index": 0},
	{"type": Global.handdave2, "cd": Global.handdave2cd, "cd_start": "handdave2cdstart", "index": 1},
	{"type": Global.handdave3, "cd": Global.handdave3cd, "cd_start": "handdave3cdstart", "index": 2},
	{"type": Global.handdave4, "cd": Global.handdave4cd, "cd_start": "handdave4cdstart", "index": 3},
	{"type": Global.handdave5, "cd": Global.handdave5cd, "cd_start": "handdave5cdstart", "index": 4},
	{"type": Global.handdave6, "cd": Global.handdave6cd, "cd_start": "handdave6cdstart", "index": 5},
	{"type": Global.handdave7, "cd": Global.handdave7cd, "cd_start": "handdave7cdstart", "index": 6},
	{"type": Global.handdave8, "cd": Global.handdave8cd, "cd_start": "handdave8cdstart", "index": 7},
	{"type": Global.handdave9, "cd": Global.handdave9cd, "cd_start": "handdave9cdstart", "index": 8},
	{"type": Global.handdave10, "cd": Global.handdave10cd, "cd_start": "handdave10cdstart", "index": 9},
]

func _ready():
	spawnonboard()

func spawnonboard():
	for data in handplacement:
		spawn_dave(data["type"], data["index"])

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
	for data in handplacement:
		var cd_start_prop = data["cd_start"]
		if Global.get(cd_start_prop):
			Global.set(cd_start_prop, false)
			await get_tree().create_timer(data["cd"]).timeout
			spawn_dave(data["type"], data["index"])

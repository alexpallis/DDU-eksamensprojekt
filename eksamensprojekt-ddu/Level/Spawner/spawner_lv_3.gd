extends Control


# Preload enemy scenes
var enemy_types = Global.enemy

	
var lanes = [
	Vector2(1000, 100),  # lane1
	Vector2(1000, 210),  # lane2
	Vector2(1000, 320),  # lane3
	Vector2(1000, 430),  # lane4
]

# Format: [enemy_type_index, delay_seconds, lane_index, loop (true/false)]
var spawn_pattern = [
	[1, 5., 0, true], 
	[1, 6., 1, true],  
	[1, 7., 2, true], 
	[1, 8., 3, true],  
	[4, 1.0, 3, false],
	[5, 8.2, 1, false],
	[2, 30, 1, false],
	[5, 30, 1, false],
	[4, 29.7, 1, false],
	[1, 30, 1, false],
	[0, 29, 1, false],
	[0, 29.2, 1, false],
	[2, 30, 2, false],
	[5, 30, 2, false],
	[4, 29.7, 2, false],
	[1, 30, 2, false],
	[0, 29, 2, false],
	[0, 29.2, 2, false],
	[5, 8.2, 1, true],
	[3, 20, 0, false],
	[0, 20.2, 0, false],
	[1, 21, 0, false],
	[3, 20, 3, false],
	[0, 20.2, 3, false],
	[1, 21, 3, false],
]

var current_spawn_index := 0
var looping_spawns := []


func _ready():
	spawn_once_enemies()
	start_looping_enemies()


func spawn_once_enemies():
	for data in spawn_pattern:
		if not data[3]:  # If not looped
			var enemy_type_index = data[0]
			var delay = 2 * data[1]
			var lane_index = data[2]
			spawn_with_delay(enemy_type_index, delay, lane_index)


func start_looping_enemies():
	for data in spawn_pattern:
		if data[3]:  # If looped
			var enemy_type_index = data[0]
			var delay = data[1]
			var lane_index = data[2]
			spawn_looping(enemy_type_index, delay, lane_index)


func spawn_with_delay(enemy_type_index: int, delay: float, lane_index: int) -> void:
	await get_tree().create_timer(delay).timeout
	spawn_enemy(enemy_type_index, lane_index)


func spawn_looping(enemy_type_index: int, delay: float, lane_index: int) -> void:
	while true:
		await get_tree().create_timer(delay).timeout
		spawn_enemy(enemy_type_index, lane_index)


func spawn_enemy(enemy_type_index: int, lane_index: int):
	if enemy_type_index < 0 or enemy_type_index >= enemy_types.size():
		push_error("Invalid enemy type index: %d" % enemy_type_index)
		return
	if lane_index < 0 or lane_index >= lanes.size():
		push_error("Invalid lane index: %d" % lane_index)
		return

	var enemy_scene = enemy_types[enemy_type_index]
	var enemy_instance = enemy_scene.instantiate()
	add_child(enemy_instance)

	enemy_instance.position = lanes[lane_index]

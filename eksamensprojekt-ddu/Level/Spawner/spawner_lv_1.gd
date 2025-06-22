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
	[0, 5.5, 0, false], 
	[0, 10.0, 2, true],   
	[0, 1.0, 3, false],
	[0, 8.2, 1, true],
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
			var delay = data[1]
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

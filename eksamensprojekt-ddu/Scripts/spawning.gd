extends Control

@onready var spawning_timer = $SpawningTimer
@export var ENEMY_UNIT = preload("res://Scenes/enemy_unit.tscn")

var lane1 = Vector2(1000, 100)
var lane2 = Vector2(1000, 200)
var lane3 = Vector2(1000, 300)
var lane4 = Vector2(1000, 400)

func _on_spawning_timer_timeout():
	var enemy = ENEMY_UNIT.instantiate()
	enemy.position = lane1
	self.add_sibling(enemy)
	

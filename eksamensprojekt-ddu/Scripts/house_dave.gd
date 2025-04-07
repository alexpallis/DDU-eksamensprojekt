extends Container

const Maxhealth = 10000
var health = 10000 

@onready var hitbox = $Hitbox

func have_been_stolen(amount):
	health -= amount
	set_healthbar()

	print("Daves house took damage! Remaining health:", health)
	if health <= 0:
		die()
		get_tree().change_scene_to_file("res://Scenes/You_lose.tscn")

func die():
	print("YOU LOOS")
	queue_free()

func _ready():
	$CanvasLayer/Dave_health_bar.value = Maxhealth
	set_healthbar()

func set_healthbar():
	$CanvasLayer/Dave_health_bar.value = health
	

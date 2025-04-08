extends Container

const Maxhealth = 10000
var health = 1000

@onready var hitbox = $Hitbox
@onready var coin_counter = $CanvasLayer/Coin_counter


func _ready():
	set_healthbar()
	set_health_label()
	
func have_been_stolen(amount):
	health -= amount
	update_health_bar()

	print("Daves house took damage! Remaining health:", health)
	if health <= 0:
		die()
		get_tree().change_scene_to_file("res://Scenes/You_lose.tscn")

func die():
	print("YOU LOOS")
	queue_free()
	get_tree().change_scene_to_file("res://Scenes/You_lose.tscn")

func update_health_bar():
	set_healthbar()
	set_health_label()

func set_healthbar():
	$CanvasLayer/Dave_health_bar.value = health

func set_health_label():
	$CanvasLayer/Label.text = "hp: %s " % health

func _process(delta):
	coin_counter.text = "you have " + str(int(Global.Coin)) + " coins."
	

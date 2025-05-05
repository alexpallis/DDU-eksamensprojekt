extends Container

const Maxhealth = 100
@export var health = 100

@onready var hitbox = $Hitbox
@onready var coin_counter = $CanvasLayer/Coin_counter


func _ready():
	set_healthbar()
	set_health_label()
	
func have_been_stolen(amount):
	health -= amount
	update_health_bar()

	print("Daves house took damage! Remaining health:", health)
	if health <= 0 and Global.Tutor == false:
		get_tree().change_scene_to_file("res://Scenes/lose_scenes.tscn")
		die()

func die():
	print("YOU LOOS")
	queue_free()

func update_health_bar():
	set_healthbar()
	set_health_label()

func set_healthbar():
	$CanvasLayer/Dave_health_bar.value = health

func set_health_label():
	$CanvasLayer/Label.text = "Valuables left: %s " % health

func _process(delta):
	coin_counter.text = "you have " + str(int(Global.Coin)) + " coins"
	

extends Container

const Maxhealth = 10000
var health = 10000 

@onready var hitbox = $Hitbox

func have_been_stolen(amount):
	health -= amount
	print("Daves house took damage! Remaining health:", health)
	set_healthbar()
	if health <= 0:
		die()

func die():
	print("YOU WIN")
	queue_free()

func _ready():
	$CanvasLayer/David_health_bar.value = Maxhealth
	set_healthbar()

func set_healthbar():
	$CanvasLayer/David_health_bar.value = health

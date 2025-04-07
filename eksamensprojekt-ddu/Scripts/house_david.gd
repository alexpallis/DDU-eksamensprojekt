extends Container


var health = 10000 

@onready var hitbox = $Hitbox

func _ready():
	set_healthbar()
	set_health_label()

func have_been_stolen(amount):
	health -= amount
	print("Daves house took damage! Remaining health:", health)
	update_health_bar()
	if health <= 0:
		die()

func die():
	print("YOU WIN")
	queue_free()

<<<<<<< HEAD
func _ready():
	$CanvasLayer/David_health_bar.value = Maxhealth
=======

func update_health_bar():
>>>>>>> 9d0752a796489b007cd6d87da7be738eba41be0f
	set_healthbar()
	set_health_label()

func set_healthbar():
	$CanvasLayer/David_health_bar.value = health
<<<<<<< HEAD
=======

func set_health_label():
	$CanvasLayer/David_health_Label.text = "hp: %s " % health
>>>>>>> 9d0752a796489b007cd6d87da7be738eba41be0f

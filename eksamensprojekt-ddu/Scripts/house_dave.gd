extends Container

var health = 10000 

@onready var hitbox = $Hitbox

func have_been_stolen(amount):
	health -= amount

	print("Daves house took damage! Remaining health:", health)
	if health <= 0:
		die()

func die():
	print("YOU LOOS")
	queue_free()

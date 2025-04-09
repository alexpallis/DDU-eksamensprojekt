extends Container

var health = 50

func take_damage(amount):
	health -= amount
	print("Unit took damage! Remaining health:", health)
	if health <= 0:
		die()

func die():
	print("Unit has been defeated.")
	queue_free()

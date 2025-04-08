extends Button





func _on_pressed():
	owner.find_child("Inventoria").add_slot(str(randi() % 11))

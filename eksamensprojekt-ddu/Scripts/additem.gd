extends Button


var currdavid



func _on_pressed():
	var currdavid = str(randi() % 11)
	owner.find_child("Inventoria").add_slot(currdavid)

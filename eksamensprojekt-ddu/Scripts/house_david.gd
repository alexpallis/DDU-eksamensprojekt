extends Container


var health = 1000

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
	get_tree().change_scene_to_file("res://Scenes/level_select.tscn")




func update_health_bar():

	set_healthbar()
	set_health_label()

func set_healthbar():
	$CanvasLayer/David_health_bar.value = health


func set_health_label():
	$CanvasLayer/David_health_Label.text = "hp: %s " % health

extends Container


@export var health = 100
@export var Level = 1
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
	if Level - 1 == Global.level:
		Global.level +1
	get_tree().change_scene_to_file("res://Scenes/level_select.tscn")
	queue_free()
	




func update_health_bar():

	set_healthbar()
	set_health_label()

func set_healthbar():
	$CanvasLayer/David_health_bar.value = health


func set_health_label():
	$CanvasLayer/David_health_Label.text = "Valuables left: %s " % health

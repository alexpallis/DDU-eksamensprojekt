extends Container

var start_position
var unit_highlighted = false
var moveable = false
var lane1 = false
var lane2 = false
var lane3 = false
var lane4 = false
var moving = true
var attacking = false

var speed = 200 * Global.enemy_difficulty
var steal_value = 25 * Global.enemy_difficulty
var attack_cooldown = 1.0
var attack_damage = 10 * Global.enemy_difficulty
var health = 1
var can_attack = true

@onready var attack_area = $AttackArea2D

func _ready():
	start_moving()

func nolane():
	lane1 = false
	lane2 = false
	lane3 = false
	lane4 = false


func start_moving():
	print("Unit has reached its position and is now moving.")  # Debugging
	moving = true

func _process(delta):
	if moving and !attacking:
		self.global_position.x += -speed * delta  # Moves right

func die():
	print("Unit has been defeated.")
	queue_free()


func _on_attack_area_area_entered(body):
	print("Detected collision with:", body.name)  # Debugging

	if body == self:
		print("Ignoring self-collision.")
		return

	if body.has_method("have_been_stolen") and moving == true:
		print("stealing:", body.name)
		body.have_been_stolen(steal_value)
		die()
	
	if body.has_method("take_damage") and moving == true:
		attacking = true  # Stop movement when attacking
		await attack_target(body)


	else:
		print("Body does not have 'take_damage' method:", body.name)
		


func _on_attack_area_area_exited(_area):
	attacking = false
	print("hi")
	
func attack_target(body):
	while is_instance_valid(body) and body.has_method("take_damage") and attacking:
		if can_attack:
			print("Attacking:", body.name)
			body.take_damage(attack_damage)
			die()
			await get_tree().create_timer(attack_cooldown).timeout

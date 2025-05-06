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

var speed = 500 * Global.enemy_difficulty # Speed of movement to the right
var steal_value = 10 * Global.enemy_difficulty # the amount the unit steals from the hous
var attack_cooldown = 5.0  # Time between attacks
var attack_damage = 250 * Global.enemy_difficulty  # Default attack damage
var health = 200 * Global.enemy_difficulty # Unit health
var can_attack = true

@onready var attack_area = $AttackArea2D
@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready():
	start_position = self.global_position


func _on_mouse_entered():
	unit_highlighted = true

func _on_mouse_exited():
	unit_highlighted = false

func _on_gui_input(event):
	if event is InputEventMouseButton:
		if unit_highlighted and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			#moveable = true
			pass
		elif event.button_index == MOUSE_BUTTON_LEFT and !event.pressed:
			moveable = false
			if lane1:
				move_to_position(Vector2(1000, 100))
			if lane2:
				move_to_position(Vector2(1000, 200))
			if lane3:
				move_to_position(Vector2(1000, 300))
			if lane4:
				move_to_position(Vector2(1000, 400))

func nolane():
	lane1 = false
	lane2 = false
	lane3 = false
	lane4 = false

func move_to_position(target_position: Vector2):
	print("Moving unit to:", target_position)  # Debugging
	
	moveable = false  # Disable dragging
	var tween = create_tween()
	tween.tween_property(self, "global_position", target_position, 0.2).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)

	# Wait for tween to finish before starting movement
	await tween.finished
	start_moving()

func start_moving():
	print("Unit has reached its position and is now moving.")  # Debugging
	moving = true

func _process(delta):
	if moveable:
		self.global_position = get_global_mouse_position()
		if Global.Lane1MouseOn:
			nolane()
			lane1 = true
		elif Global.Lane2MouseOn:
			nolane()
			lane2 = true
		elif Global.Lane3MouseOn:
			nolane()
			lane3 = true
		elif Global.Lane4MouseOn:
			nolane()
			lane4 = true
		else:
			nolane()
	elif moving and !attacking:
		self.global_position.x += -speed * delta  # Moves right

	

func take_damage(amount):
	if moving:
		health -= amount
		print("Unit took damage! Remaining health:", health)
		if health <= 0:
			die()

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
		animated_sprite_2d.play("Idl")


	else:
		print("Body does not have 'take_damage' method:", body.name)
		


func _on_attack_area_area_exited(body):
	animated_sprite_2d.play("Walk")
	attacking = false
	print("hi")
	
func attack_target(body):
	while is_instance_valid(body) and body.has_method("take_damage") and attacking:
		if can_attack:
			print("Attacking:", body.name)
			body.take_damage(attack_damage)
			speed = 0
			attack_damage = 0
			await get_tree().create_timer(attack_cooldown).timeout
			speed = 0
			attack_damage = 250	

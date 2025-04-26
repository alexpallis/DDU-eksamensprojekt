extends Container

var start_position
var unit_highlighted = false
var moveable = false
var lane1 = false
var lane2 = false
var lane3 = false
var lane4 = false

var hand1 = false
var hand2 = false
var hand3 = false
var hand4 = false
var hand5 = false
var hand6 = false
var hand7 = false
var hand8 = false
var hand9 = false
var hand10 = false

var moving = false
var attacking = false
var unitid = 1

var speed = 200  # Speed of movement to the right
var steal_value = 10 # the amount the unit steals from the hous
var attack_cooldown = 1.0  # Time between attacks
var attack_damage = 15  # Default attack damage
var health = 200  # Unit health
var can_attack = true
var price = 10 # how much the unit cost

@onready var attack_area = $AttackArea2D
@onready var cooldown = $cooldown
@onready var cost = $"cost hide/Cost"

func _ready():
	start_position = self.global_position
	cost.text = str(price) + " coins"

func _on_mouse_entered():
	unit_highlighted = true

func _on_mouse_exited():
	unit_highlighted = false

func _on_gui_input(event):
	if event is InputEventMouseButton:
		if unit_highlighted and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			moveable = true
		elif event.button_index == MOUSE_BUTTON_LEFT and !event.pressed:
			moveable = false
			if lane1:
				move_to_position(Vector2(200, 100))
			if lane2:
				move_to_position(Vector2(200, 210))
			if lane3:
				move_to_position(Vector2(200, 320))
			if lane4:
				move_to_position(Vector2(200, 430))

			if hand1:
				select(Vector2(200, 100))
			if hand2:
				select(Vector2(200, 100))
			if hand3:
				select(Vector2(200, 100))
			if hand4:
				select(Vector2(200, 100))
			if hand5:
				select(Vector2(200, 100))
			if hand6:
				select(Vector2(200, 100))
			if hand7:
				select(Vector2(200, 100))
			if hand8:
				select(Vector2(200, 100))
			if hand9:
				select(Vector2(200, 100))
			if hand10:
				select(Vector2(200, 100))

func nolane():
	lane1 = false
	lane2 = false
	lane3 = false
	lane4 = false

	hand1 = false
	hand2 = false
	hand3 = false
	hand4 = false
	hand5 = false
	hand6 = false
	hand7 = false
	hand8 = false
	hand9 = false
	hand10 = false

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
	Global.Coin -= price
	cost.visible = false
	if unitid == Global.handdave1:
		Global.handdave1cdstart = true
	if unitid == Global.handdave2:
		Global.handdave2cdstart = true
	if unitid == Global.handdave3:
		Global.handdave3cdstart = true
	if unitid == Global.handdave4:
		Global.handdave4cdstart = true
	if unitid == Global.handdave5:
		Global.handdave5cdstart = true
	if unitid == Global.handdave6:
		Global.handdave6cdstart = true
	
	
func _process(delta):
	if moveable and Global.Coin >= price:
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

		elif Global.Hand1MouseOn:
			nolane()
			hand1 = true
		elif Global.Hand2MouseOn:
			nolane()
			hand2 = true
		elif Global.Hand3MouseOn:
			nolane()
			hand3 = true
		elif Global.Hand4MouseOn:
			nolane()
			hand4 = true
		elif Global.Hand5MouseOn:
			nolane()
			hand5 = true
		elif Global.Hand6MouseOn:
			nolane()
			hand6 = true
		elif Global.Hand7MouseOn:
			nolane()
			hand7 = true
		elif Global.Hand8MouseOn:
			nolane()
			hand8 = true
		elif Global.Hand9MouseOn:
			nolane()
			hand9 = true
		elif Global.Hand10MouseOn:
			nolane()
			hand10 = true

		else:
			nolane()
	elif moving and !attacking:
		$AttackArea.collision_layer = 1
		self.global_position.x += speed * delta 

	

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
	print("Detected collision with:", body.name) 

	if body == self:
		print("Ignoring self-collision.")
		return

	if body.has_method("have_been_stolen") and moving == true:
		print("stealing:", body.name)
		body.have_been_stolen(steal_value)
		die()


	if body.has_method("take_damage") and moving == true:
		print("Attacking:", body.name)
		attacking = true 
		await attack_target(body)
	

	else:
		print("Body does not have 'take_damage' method:", body.name)


func _on_attack_area_area_exited(_area):

	can_attack = true
	attacking = false
	print("hi")

func attack_target(body):
	while is_instance_valid(body) and body.has_method("take_damage") and attacking:
		print("Attacking:", body.name)
		body.take_damage(attack_damage)
		await get_tree().create_timer(attack_cooldown).timeout


func select(target_position: Vector2,):
	
	var tween = create_tween()
	tween.tween_property(self, "global_position", target_position, 0.2).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)

	if hand1:
		Global.handdave1 = unitid
	if hand2:
		Global.handdave2 = unitid
	if hand3:
		Global.handdave3 = unitid
	if hand4:
		Global.handdave4 = unitid
	if hand5:
		Global.handdave5 = unitid
	if hand6:
		Global.handdave6 = unitid
	if hand7:
		Global.handdave7 = unitid
	if hand8:
		Global.handdave8 = unitid
	if hand9:
		Global.handdave9 = unitid
	if hand10:
		Global.handdave10 = unitid

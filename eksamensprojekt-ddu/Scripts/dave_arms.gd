extends Container

var start_position
var unit_highlighted = false
var moveable = false
var lane1 = false
var lane2 = false
var lane3 = false
var lane4 = false
var moving = false
var attacking = false
var unitid = 2

var sf = 1 + (Global.D2 - 1) / 10.0

@export var speed = 150 * sf # Speed of movement to the right
@export var steal_value = 10 * sf # the amount the unit steals from the hous
@export var attack_cooldown = 1.0   # Time between attacks
@export var attack_damage = 20 * sf # Default attack damage
@export var health = 200 * sf # Unit health
var can_attack = true
@export var price = 30 # how much the unit cost
var current_hand_slot: int = -1
var current_lane: int = -1

var previous_hand_slot: int = -1

@onready var attack_area = $AttackArea2D
@onready var cooldown = $cooldown
@onready var cost = $CoinCost/Cost


func _ready():

	self.tooltip_text = ("Beefcake Dave" +
		"\n" + str(Global.D2) + " Level" + 
		"\n" + str(speed) + " Speed" +
		"\n" + str(attack_cooldown) + " cooldown" +
		"\n" + str(steal_value) + " Steal" +
		"\n" + str(attack_damage) + " Attack" +
		"\n" + str(health) + " Health" +
		"\n" + str(price) + " Coins" +  
		"\n Skipped leg day")

	cost.text = str(price) + " Coins"

func _on_mouse_entered():
	unit_highlighted = true

func _on_mouse_exited():
	unit_highlighted = false

func _on_gui_input(event):
	if event is InputEventMouseButton:
		if unit_highlighted and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			moveable = true
			previous_hand_slot = current_hand_slot
		elif event.button_index == MOUSE_BUTTON_LEFT and !event.pressed:
			moveable = false
			if current_lane != -1:
				move_to_position(Vector2(100, 100 + (current_lane - 1) * 110))
			elif current_hand_slot != -1:
				select(Vector2(91 + (current_hand_slot - 1) * 102, 84))

func move_to_position(target_position: Vector2):
	moveable = false
	var tween = create_tween()
	tween.tween_property(self, "global_position", target_position, 0.2).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)
	await tween.finished
	start_moving()

func start_moving():
	moving = true
	Global.Coin -= price
	cost.hide()
	match unitid:
		Global.handdave1: Global.handdave1cdstart = true
		Global.handdave2: Global.handdave2cdstart = true
		Global.handdave3: Global.handdave3cdstart = true
		Global.handdave4: Global.handdave4cdstart = true
		Global.handdave5: Global.handdave5cdstart = true
		Global.handdave6: Global.handdave6cdstart = true
		Global.handdave7: Global.handdave7cdstart = true
		Global.handdave8: Global.handdave8cdstart = true
		Global.handdave9: Global.handdave9cdstart = true
		Global.handdave10: Global.handdave10cdstart = true

func _process(delta):
	if moveable and Global.Coin >= price:
		self.global_position = get_global_mouse_position()
		update_hand_or_lane()
	elif moving and !attacking:
		$AttackArea.collision_layer = 1
		self.global_position.x += speed * delta 

func update_hand_or_lane():
	current_hand_slot = -1
	current_lane = -1

	if Global.Lane1MouseOn:
		current_lane = 1
	elif Global.Lane2MouseOn:
		current_lane = 2
	elif Global.Lane3MouseOn:
		current_lane = 3
	elif Global.Lane4MouseOn:
		current_lane = 4
	elif Global.Hand1MouseOn:
		current_hand_slot = 1
	elif Global.Hand2MouseOn:
		current_hand_slot = 2
	elif Global.Hand3MouseOn:
		current_hand_slot = 3
	elif Global.Hand4MouseOn:
		current_hand_slot = 4
	elif Global.Hand5MouseOn:
		current_hand_slot = 5
	elif Global.Hand6MouseOn:
		current_hand_slot = 6
	elif Global.Hand7MouseOn:
		current_hand_slot = 7
	elif Global.Hand8MouseOn:
		current_hand_slot = 8
	elif Global.Hand9MouseOn:
		current_hand_slot = 9
	elif Global.Hand10MouseOn:
		current_hand_slot = 10

func select(target_position: Vector2):
	var tween = create_tween()
	tween.tween_property(self, "global_position", target_position, 0.2).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)

	if previous_hand_slot != -1:
		set_hand_slot(previous_hand_slot, -1)
	if current_hand_slot != -1:
		set_hand_slot(current_hand_slot, unitid)

func set_hand_slot(slot: int, value: int):
	match slot:
		1: Global.handdave1 = value
		2: Global.handdave2 = value
		3: Global.handdave3 = value
		4: Global.handdave4 = value
		5: Global.handdave5 = value
		6: Global.handdave6 = value
		7: Global.handdave7 = value
		8: Global.handdave8 = value
		9: Global.handdave9 = value
		10: Global.handdave10 = value

func take_damage(amount):
	if moving:
		health -= amount
		if health <= 0:
			die()

func die():
	queue_free()

func _on_attack_area_area_entered(body):
	if body == self:
		return

	if body.has_method("have_been_stolen") and moving:
		body.have_been_stolen(steal_value)
		die()

	elif body.has_method("take_damage") and moving:
		attacking = true 
		await attack_target(body)

func _on_attack_area_area_exited(_area):
	can_attack = true
	attacking = false

func attack_target(body):
	while is_instance_valid(body) and body.has_method("take_damage") and attacking:
		body.take_damage(attack_damage)
		await get_tree().create_timer(attack_cooldown).timeout

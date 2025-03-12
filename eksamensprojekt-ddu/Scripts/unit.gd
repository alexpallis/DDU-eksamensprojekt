extends Container
var startPosition
var unitHighlighted = false
var moveable = false
var lane1 = false
var lane2 = false
var lane3 = false
var lane4 = false
var positin = self.global_position
@onready var unit_container = $"../UnitContainer"

func _ready():
	startPosition = self.position
	
func _on_mouse_entered():
	unitHighlighted = true

func _on_mouse_exited():
	unitHighlighted = false


func _on_gui_input(event):
	if (event is InputEventMouseButton):
		if unitHighlighted:
			if event.button_mask == 1:
				moveable = true
	elif event.button_mask == 0:
		moveable = false
		if lane1:
			#move_toward
			pass
	else:
		pass

func nolane():
	lane1 = false
	lane2 = false
	lane3 = false
	lane4 = false
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

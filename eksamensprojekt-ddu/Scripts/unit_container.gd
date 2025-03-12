extends HBoxContainer


var startPosition
var maxUnitsAllowed = 5

func _ready():
	self.size.x = maxUnitsAllowed*105
	self.pivot_offset.x = maxUnitsAllowed*52.5
	var projectResolution = ProjectSettings.get_setting("display/window/size/viewport_width")
	var projectResolutionHeight = ProjectSettings.get_setting("display/window/size/viewport_height")
	self.global_position.x = projectResolution/4
	self.global_position.y = (projectResolutionHeight) - 170
	var tween2 = get_tree().create_tween()
	tween2.tween_property(self, "scale", Vector2(1.3,1.3), 0.2)
	startPosition = self.position

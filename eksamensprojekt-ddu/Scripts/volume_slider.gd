extends HSlider

@export
var BusName : String

var BusIndex: int

func _ready() -> void:
	BusIndex = AudioServer.get_bus_index(BusName)
	value_changed.connect(_on_value_chaned)

	value = db_to_linear(
		AudioServer.get_bus_volume_db(BusIndex)
	)

func _on_value_chaned(value: float) -> void:
	AudioServer.set_bus_volume_db(
		BusIndex,
		linear_to_db(value)
	)

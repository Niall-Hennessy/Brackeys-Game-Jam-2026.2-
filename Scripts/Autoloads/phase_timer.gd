extends Node

var number_of_timer_units: int = 3
var current_timer_unit: int = 0

func _ready() -> void:
	EventBus.connect("progress_phase_timer", progress_phase_timer)

func progress_phase_timer():
	current_timer_unit += 1
	if current_timer_unit >= number_of_timer_units:
		current_timer_unit = 0
		EventBus.emit_signal("progress_to_next_phase")
	EventBus.emit_signal("phase_timer_updated")

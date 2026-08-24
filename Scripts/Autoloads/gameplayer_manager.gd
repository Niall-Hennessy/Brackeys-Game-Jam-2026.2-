extends Node

func _ready() -> void:
	EventBus.connect("entered_gameplay_phase", go_to_gameplay)

func go_to_gameplay():		
	Dialogic.start("gameplay_phase_1")

func end_gameplay():
	EventBus.emit_signal("progress_to_next_phase")

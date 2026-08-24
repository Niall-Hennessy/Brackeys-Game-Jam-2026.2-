extends Node

func _ready() -> void:
	EventBus.connect("entered_gameplay_phase", go_to_gameplay)

func go_to_gameplay():
	if Dialogic.current_timeline != null:
		return
		
	Dialogic.start("gameplay_phase_1")

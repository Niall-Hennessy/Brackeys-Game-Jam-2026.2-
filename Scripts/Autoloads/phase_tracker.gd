extends Node

enum phases {CUTSCENE, INTERACT, GAMEPLAY}

var first_phase = phases.CUTSCENE

var number_of_phases: int = 3
var current_phase: int = first_phase

func _ready() -> void:
	EventBus.connect("progress_to_next_phase", progress_current_phase)

func progress_current_phase():
	current_phase += 1
	if current_phase >= phases.size():
		current_phase = first_phase
		
	if current_phase == phases.CUTSCENE:
		EventBus.emit_signal("entered_cutscene_phase")
		print("entered_cutscene_phase")
		
	if current_phase == phases.INTERACT:
		EventBus.emit_signal("entered_interact_phase")
		print("entered_interact_phase")
		
	if current_phase == phases.GAMEPLAY:
		EventBus.emit_signal("entered_gameplay_phase")
		print("entered_gameplay_phase")
		
	EventBus.emit_signal("phase_updated")

func reset_phase():
	current_phase = first_phase

extends Node

func _ready() -> void:
	EventBus.entered_cutscene_phase.connect(run_next_cutscene)
	
func run_next_cutscene(): #perhaps change to take an argument instead
	Dialogic.start("round_" + str(PhaseTracker.current_round) + "_cutscene")

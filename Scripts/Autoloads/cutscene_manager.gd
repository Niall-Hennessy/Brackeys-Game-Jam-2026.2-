extends Node

func _ready() -> void:
	EventBus.entered_cutscene_phase.connect(run_next_cutscene)
	
func run_next_cutscene(): #perhaps change to take an argument instead
	if Dialogic.current_timeline != null:
		return
		
	Dialogic.start("prototype_intro_cutscene")

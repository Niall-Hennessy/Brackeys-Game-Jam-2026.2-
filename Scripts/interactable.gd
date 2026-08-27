class_name Interactable extends Node

@export var interactable_name: String
var current_round_dialogue: int = 1

# dialogue/decision making logic can live here
func _ready() -> void:
	EventBus.connect("entered_cutscene_phase", reset_current_round_dialogue)
	
func interaction() -> void:
	print(interactable_name + "_round_" + str(PhaseTracker.current_round) + "_dialogue_" + str(current_round_dialogue))
	Dialogic.start(interactable_name + "_round_" + str(PhaseTracker.current_round) + "_dialogue_" + str(current_round_dialogue))
	current_round_dialogue += 1

func reset_current_round_dialogue():
	current_round_dialogue = 1

func increase_current_round_dialogue():
	current_round_dialogue += 1

class_name Interactable extends Node

@export var interactable_name: String
@export var current_round_dialogue: int = 1
@export var max_round_dialogue: int = 3
@export var consume_time_slot: bool = true

# dialogue/decision making logic can live here
func _ready() -> void:
	EventBus.connect("entered_cutscene_phase", reset_current_round_dialogue)
	
func interaction() -> void:
	print(interactable_name + "_round_" + str(PhaseTracker.current_round) + "_dialogue_" + str(current_round_dialogue))
	Dialogic.start(interactable_name + "_round_" + str(PhaseTracker.current_round) + "_dialogue_" + str(current_round_dialogue))
	current_round_dialogue += 1
	
	if current_round_dialogue > max_round_dialogue:
		current_round_dialogue = max_round_dialogue
		
	if consume_time_slot:
		InteractPhaseManager.consume_interaction_time()

func reset_current_round_dialogue():
	current_round_dialogue = 1

func increase_current_round_dialogue():
	current_round_dialogue += 1

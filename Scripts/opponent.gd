class_name Opponent extends Node

@export var opponent_name: String
@export var number:int # 1 to 5, 0 for none
@export var dialogues = [] #Could be improved but notion is to idividualize different opponents dialogues

var current_round_dialogue: int = 1

 # dialogue/decision making logic can live here
func _ready() -> void:
	if not number:
		number = 1
	
	EventBus.connect("entered_cutscene_phase", reset_current_round_dialogue)

func reset_current_round_dialogue():
	current_round_dialogue = 1

func start_dialogue(opponent_number) -> void:
	if opponent_number != number:
		return
	
	print(opponent_name + "_round_" + str(PhaseTracker.current_round) + "_dialogue_" + str(current_round_dialogue))
	Dialogic.start(opponent_name + "_round_" + str(PhaseTracker.current_round) + "_dialogue_" + str(current_round_dialogue)) #Magic number alert
	current_round_dialogue += 1

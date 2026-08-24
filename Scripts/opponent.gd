class_name Opponent extends Node

@export var number:int # 1 to 5, 0 for none
@export var dialogues = ["test_timeline"] #Could be improved but notion is to idividualize different opponents dialogues

 # dialogue/decision making logic can live here
func _ready() -> void:
	if not number:
		number = 1

func start_dialogue(opponent_number) -> void:
	if opponent_number != number:
		return
	
	if Dialogic.current_timeline != null:
		return
		
	Dialogic.start(dialogues[0]) #Magic number alert

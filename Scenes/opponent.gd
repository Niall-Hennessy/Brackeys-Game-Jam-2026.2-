class_name Opponent extends Node3D

@export var number:int # 1 to 5, 0 for none
@export var dialogues = [] #Could be improved but notion is to idividualize different opponents dialogues

 # dialogue/decision making logic can live here
func _ready() -> void:
	if not number:
		number = 1
		
	EventBus.connect("opponent_interacted", interaction)

func interaction():
	Dialogic.start(dialogues[0]) #Magic number alert

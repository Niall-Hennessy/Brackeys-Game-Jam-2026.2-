extends Node

func _ready() -> void:
	
	if Dialogic.current_timeline != null:
		return
		
	Dialogic.start("prototype_intro_cutscene") #Magic number alert

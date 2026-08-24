class_name Interactable extends Node

#func _ready() -> void:
	#EventBus.connect("object_interacted", interaction)

func interaction(interactable:Node3D) -> void:

	if interactable == null:
		return
	if interactable.has_node("InteractableComponent"):
		print("beep")
	if interactable.has_node("OpponentComponent"):
		var opponent = interactable.get_node("OpponentComponent")
		opponent.start_dialogue(1) #TODO magic number
	return

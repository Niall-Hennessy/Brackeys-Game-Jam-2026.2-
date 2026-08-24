class_name Interactable extends Node

func _ready() -> void:
	EventBus.connect("object_interacted", interaction)

func interaction(_interaction_id:int) -> void:
	# underscored the argument because we don't use it
	# maybe replace the integer argument with an Interactable so we can just pass self
	# and get the opponent number or interaction data from that?
	return

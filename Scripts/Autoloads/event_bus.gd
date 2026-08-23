extends Node

signal progress_phase_timer
signal progress_to_next_phase

signal phase_timer_updated
signal phase_updated

signal opponent_interacted(opponent:int)


func _ready() -> void:
	opponent_interacted.connect(on_interact_with_opponent)

func on_interact_with_opponent(opponent:int):
	print("opponent interacted! ", opponent)

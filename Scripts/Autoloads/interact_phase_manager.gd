extends Node

func interaction_finished():
	EventBus.emit_signal("progress_phase_timer")

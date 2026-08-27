extends Button


func _on_button_down() -> void:
	# you'll only land here from dying during gameplay so you don't need to shift the phase
	# this is just here cause I tested the scene in a vacuum
	PhaseTracker.rollback_to_gameplay_phase()
	get_tree().change_scene_to_file("res://Scenes/talk_phase_scene.tscn")

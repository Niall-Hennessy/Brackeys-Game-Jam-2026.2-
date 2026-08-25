extends Button


func _on_button_down() -> void:
	PhaseTracker.rollback_to_interact_phase()
	# normally the mouse phase is toggled in Dialogic after the cutscene, do it manually here
	MouseManager.set_mouse_mode_captured()
	get_tree().change_scene_to_file("res://Scenes/talk_phase_scene.tscn")

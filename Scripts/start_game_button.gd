extends Button

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/talk_phase_scene.tscn")
	CutsceneManager.run_next_cutscene()

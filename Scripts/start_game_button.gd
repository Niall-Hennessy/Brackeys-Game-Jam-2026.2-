extends Button

func _ready() -> void:
	connect("pressed", _on_pressed)

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/talk_phase_scene.tscn")
	PhaseTracker.reset_game()
	CutsceneManager.run_next_cutscene()

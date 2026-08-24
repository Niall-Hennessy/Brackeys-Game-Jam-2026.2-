extends Button

func _ready() -> void:
	connect("pressed", _on_pressed)

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/talk_phase_scene.tscn")
	CutsceneManager.run_next_cutscene()
	PhaseTracker.reset_phase()

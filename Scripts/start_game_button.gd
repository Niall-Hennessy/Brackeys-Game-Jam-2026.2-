extends Button

func _ready() -> void:
	print("start ready")
	connect("pressed", _on_pressed)

func _on_pressed() -> void:
	print("start pressed")
	get_tree().change_scene_to_file("res://Scenes/talk_phase_scene.tscn")
	CutsceneManager.run_next_cutscene()

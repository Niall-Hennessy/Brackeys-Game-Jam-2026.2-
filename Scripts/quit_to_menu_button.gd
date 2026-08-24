extends Button


func _on_button_down() -> void:
	get_tree().paused = false
	MouseManager.set_mouse_mode_visible()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

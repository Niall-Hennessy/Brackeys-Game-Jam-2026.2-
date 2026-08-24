extends Button



func _on_button_up() -> void:
	get_tree().paused = false
	# if a cutscene was playing, don't hide the mouse because you'll still need it
	if Dialogic.current_timeline == null:
		MouseManager.set_mouse_mode_captured()
	get_parent().get_parent().visible = false

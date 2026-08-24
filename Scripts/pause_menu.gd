extends CanvasLayer

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		get_tree().paused = !get_tree().paused
		# if a cutscene was playing, don't toggle the mouse because it will already be visible
		if Dialogic.current_timeline == null:
			MouseManager.switch_mouse_mode()
			Dialogic.Text.hide_textbox()
		visible = !visible

extends Node

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func switch_mouse_mode():
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	elif Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func set_mouse_mode_captured():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func set_mouse_mode_visible():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	

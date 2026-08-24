extends Button

func _ready() -> void:
	connect("pressed", on_pressed)
	print("quit ready")

func on_pressed() -> void:
	print("quit pressed")
	get_tree().quit()

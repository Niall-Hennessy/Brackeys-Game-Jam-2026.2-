extends Button

func _ready() -> void:
	connect("pressed", on_pressed)

func on_pressed() -> void:
	get_tree().quit()

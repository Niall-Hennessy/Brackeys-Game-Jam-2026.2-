extends TextureRect

@export var phase_texture_array: Array[Texture] = []

func _ready() -> void:
	EventBus.connect("phase_timer_updated", update_phase_texture)

func update_phase_texture(current_timer_unit):
	texture = phase_texture_array[current_timer_unit]

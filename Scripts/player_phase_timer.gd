extends TextureRect

@export var phase_texture_array: Array[Texture] = []

func _ready() -> void:
	EventBus.connect("phase_timer_updated", update_phase_texture)
	EventBus.connect("entered_interact_phase", display_player_phase_timer)
	EventBus.connect("entered_cutscene_phase", hide_player_phase_timer)
	EventBus.connect("entered_gameplay_phase", hide_player_phase_timer)

func update_phase_texture(current_timer_unit):
	texture = phase_texture_array[current_timer_unit]

func hide_player_phase_timer():
	visible = false

func display_player_phase_timer():
	visible = true

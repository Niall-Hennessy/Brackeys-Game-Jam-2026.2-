extends TextureRect

@export var phase_texture_array: Array[Texture] = []

func _ready() -> void:
	EventBus.connect("phase_timer_updated", update_phase_texture)
	EventBus.connect("entered_interact_phase", display_player_phase_timer)
	EventBus.connect("entered_cutscene_phase", hide_player_phase_timer)
	EventBus.connect("entered_gameplay_phase", hide_player_phase_timer)

func update_phase_texture(current_timer_unit):
	texture = phase_texture_array[current_timer_unit]
	var label_string = " Minutes Left" if current_timer_unit != 2 else " Minute Left"
	get_node("Player Phase Label").text = str(3-current_timer_unit) + label_string

func hide_player_phase_timer():
	visible = false

func display_player_phase_timer():
	visible = true

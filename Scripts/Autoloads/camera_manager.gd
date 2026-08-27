extends Node

@export var gameplay_camera: Camera3D
@export var player_camera: Camera3D

func _ready() -> void:
	EventBus.connect("entered_gameplay_phase", switch_to_gameplay_camera)
	EventBus.connect("entered_cutscene_phase", switch_to_player_camera)

func switch_to_gameplay_camera():
	gameplay_camera.current = true

func switch_to_player_camera():
	player_camera.current = true

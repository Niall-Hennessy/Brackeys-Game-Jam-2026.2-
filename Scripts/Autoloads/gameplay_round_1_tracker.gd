extends Node

@export var segment_1_rigged: bool 
@export var segment_2_rigged: bool 
@export var segment_3_rigged: bool 
@export var segment_4_rigged: bool 
@export var segment_5_rigged: bool 
@export var segment_6_rigged: bool 

@export var gameplay_camera: Camera3D
@export var player_camera: Camera3D

func _ready() -> void:
	segment_1_rigged = true
	segment_2_rigged = false
	segment_3_rigged = true
	segment_4_rigged = false
	segment_5_rigged = true
	segment_6_rigged = false
	
	EventBus.connect("entered_gameplay_phase", switch_to_gameplay_camera)
	EventBus.connect("entered_cutscene_phase", switch_to_player_camera)
	
func switch_to_gameplay_camera():
	gameplay_camera.current = true

func switch_to_player_camera():
	player_camera.current = true

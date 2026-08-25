extends Node

@export var segment_1_rigged: bool 
@export var segment_2_rigged: bool 
@export var segment_3_rigged: bool 
@export var segment_4_rigged: bool 
@export var segment_5_rigged: bool 
@export var segment_6_rigged: bool 

func _ready() -> void:
	segment_1_rigged = true
	segment_2_rigged = false
	segment_3_rigged = true
	segment_4_rigged = false
	segment_5_rigged = true
	segment_6_rigged = false

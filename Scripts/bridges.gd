class_name Bridges extends Node3D

@onready var artsy_bridge = $ArtsyBridge
@onready var jock_bridge = $JockBridge
@onready var mean_bridge = $MeanBridge
@onready var nerd_bridge = $NerdBridge
@onready var nice_bridge = $NiceBridge
@onready var player_bridge = $PlayerBridge

var bridge_1_name = "artsy"
var bridge_2_name = "jock"
var bridge_3_name = "mean"
var bridge_4_name = "nerd"
var bridge_5_name = "nice"
var bridge_6_name = "player"

func _ready() -> void:
	GameplayRound1Tracker.bridges = self

func drop_bridge_segment_by_name(bridge_name: String, segment_number: int):
	if bridge_name == bridge_1_name:
		print(bridge_name)
		artsy_bridge.get_child(segment_number - 1).visible = false
	elif bridge_name == bridge_2_name:
		jock_bridge.get_child(segment_number - 1).visible = false
	elif bridge_name == bridge_3_name:
		mean_bridge.get_child(segment_number - 1).visible = false
	elif bridge_name == bridge_4_name:
		nerd_bridge.get_child(segment_number - 1).visible = false
	elif bridge_name == bridge_5_name:
		nice_bridge.get_child(segment_number - 1).visible = false
	elif bridge_name == bridge_6_name:
		player_bridge.get_child(segment_number - 1).visible = false

func drop_bridge_segment_by_number(bridge_number:int, segment_number: int):
	if bridge_number == 1:
		artsy_bridge.get_child(segment_number - 1).visible = false
	elif bridge_number == 2:
		jock_bridge.get_child(segment_number - 1).visible = false
	elif bridge_number == 3:
		mean_bridge.get_child(segment_number - 1).visible = false
	elif bridge_number == 4:
		nerd_bridge.get_child(segment_number - 1).visible = false
	elif bridge_number == 5:
		nice_bridge.get_child(segment_number - 1).visible = false
	elif bridge_number == 6:
		player_bridge.get_child(segment_number - 1).visible = false

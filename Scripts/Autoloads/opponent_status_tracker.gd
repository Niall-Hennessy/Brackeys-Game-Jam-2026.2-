extends Node

var artsy_is_alive: bool = true
var jock_is_alive: bool = true
var nerd_is_alive: bool = true
var mean_is_alive: bool = true
var nice_is_alive: bool = true

func _ready() -> void:
	artsy_is_alive = true
	jock_is_alive = true
	nerd_is_alive = true
	mean_is_alive = false
	nice_is_alive = true

func opponent_died(opponent_name: String):
	if opponent_name == "artsy":
		artsy_is_alive = false
		EventBus.emit_signal("artsy_dies")
	elif opponent_name == "jock":
		jock_is_alive = false
		EventBus.emit_signal("jock_dies")
	elif opponent_name == "nerd":
		nerd_is_alive = false
		EventBus.emit_signal("nerd_dies")
	elif opponent_name == "mean":
		mean_is_alive = false
		EventBus.emit_signal("mean_dies")
	elif opponent_name == "nice":
		nice_is_alive = false
		EventBus.emit_signal("nice_dies")

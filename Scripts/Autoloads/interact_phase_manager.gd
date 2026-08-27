extends Node

var opponent_artsy
var opponent_jock
var opponent_nerd
var opponent_mean
var opponent_nice

func _ready() -> void:
	EventBus.connect("artsy_dies", remove_artsy)
	EventBus.connect("jock_dies", remove_jock)
	EventBus.connect("nerd_dies", remove_nerd)
	EventBus.connect("mean_dies", remove_mean)
	EventBus.connect("nice_dies", remove_nice)

func interaction_finished():
	EventBus.emit_signal("progress_phase_timer")

func remove_artsy():
	opponent_artsy.visible = false
	
func remove_jock():
	opponent_jock.visible = false
	
func remove_nerd():
	opponent_nerd.visible = false
	
func remove_mean():
	opponent_mean.visible = false
	
func remove_nice():
	opponent_nice.visible = false

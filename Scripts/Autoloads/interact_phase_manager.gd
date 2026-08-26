extends Node

#Opponent variables are set in the OpponentNodes Script in a _ready function
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

func increase_opponent_trust_level(opponent_name: String):
	if opponent_name == "artsy":
		opponent_artsy.increase_trust_level()
	#
	#current_trust += 1
	#if current_trust > trust_levels.high_trust:
		#current_trust = trust_levels.high_trust
#
#func decrease_opponent_trust_level():
	#current_trust -= 1
	#if current_trust < trust_levels.distrust:
		#current_trust = trust_levels.distrust
		#
#func change_opponent_trust_level(change_in_trust: int):
	#change_in_trust += change_in_trust
	#
	#if current_trust > trust_levels.high_trust:
		#current_trust = trust_levels.high_trust
	#elif current_trust < trust_levels.distrust:
		#current_trust = trust_levels.distrust
#
#func set_opponent_trust_level(new_trust_level: trust_levels):
	#current_trust = new_trust_level

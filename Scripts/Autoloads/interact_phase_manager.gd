extends Node

#Opponent variables are set in the OpponentNodes Script in a _ready function
var opponent_artsy: Opponent
var opponent_jock: Opponent
var opponent_nerd: Opponent
var opponent_mean: Opponent
var opponent_nice: Opponent

func _ready() -> void:
	EventBus.connect("artsy_dies", remove_artsy)
	EventBus.connect("jock_dies", remove_jock)
	EventBus.connect("nerd_dies", remove_nerd)
	EventBus.connect("mean_dies", remove_mean)
	EventBus.connect("nice_dies", remove_nice)

func consume_interaction_time():
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

func increase_opponent_trust_level(opponent_name: String, trust_increase_target: String):
	if opponent_name == "Artsy":
		opponent_artsy.increase_trust_level(trust_increase_target)
	elif opponent_name == "Jock":
		opponent_jock.increase_trust_level(trust_increase_target)
	elif opponent_name == "Nerd":
		opponent_nerd.increase_trust_level(trust_increase_target)
	elif opponent_name == "Mean":
		opponent_mean.increase_trust_level(trust_increase_target)
	elif opponent_name == "Nice":
		opponent_nice.increase_trust_level(trust_increase_target)
#
func decrease_opponent_trust_level(opponent_name: String, trust_decrease_target: String):
	if opponent_name == "Artsy":
		opponent_artsy.decrease_trust_level(trust_decrease_target)
	elif opponent_name == "Jock":
		opponent_jock.decrease_trust_level(trust_decrease_target)
	elif opponent_name == "Nerd":
		opponent_nerd.decrease_trust_level(trust_decrease_target)
	elif opponent_name == "Mean":
		opponent_mean.decrease_trust_level(trust_decrease_target)
	elif opponent_name == "Nice":
		opponent_nice.decrease_trust_level(trust_decrease_target)
		
func change_opponent_trust_level(opponent_name: String, trust_change_target: String, change_in_trust: int):
	if opponent_name == "Artsy":
		opponent_artsy.change_opponent_trust_level(trust_change_target, change_in_trust)
	elif opponent_name == "Jock":
		opponent_jock.change_opponent_trust_level(trust_change_target, change_in_trust)
	elif opponent_name == "Nerd":
		opponent_nerd.change_opponent_trust_level(trust_change_target, change_in_trust)
	elif opponent_name == "Mean":
		opponent_mean.change_opponent_trust_level(trust_change_target, change_in_trust)
	elif opponent_name == "Nice":
		opponent_nice.change_opponent_trust_level(trust_change_target, change_in_trust)

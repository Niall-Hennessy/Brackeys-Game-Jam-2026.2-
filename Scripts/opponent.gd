class_name Opponent extends Node

@export var opponent_name: String

var current_artsy_trust: int = 0
var current_jock_trust: int = 0
var current_nerd_trust: int = 0
var current_mean_trust: int = 0
var current_nice_trust: int = 0
var current_player_trust: int = 0
enum trust_levels {distrust = -2, low_distrust = -1, no_trust = 0, low_trust = 1, high_trust = 2}

func increase_trust_level(trust_target_name: String):
	if trust_target_name == "artsy":
		current_artsy_trust += 1
		if current_artsy_trust > trust_levels.high_trust:
			current_artsy_trust = trust_levels.high_trust
	elif trust_target_name == "jock":
		current_jock_trust += 1
		if current_jock_trust > trust_levels.high_trust:
			current_jock_trust = trust_levels.high_trust
	elif trust_target_name == "nerd":
		current_nerd_trust += 1
		if current_nerd_trust > trust_levels.high_trust:
			current_nerd_trust = trust_levels.high_trust
	elif trust_target_name == "mean":
		current_mean_trust += 1
		if current_mean_trust > trust_levels.high_trust:
			current_mean_trust = trust_levels.high_trust
	elif trust_target_name == "nice":
		current_nice_trust += 1
		if current_nice_trust > trust_levels.high_trust:
			current_nice_trust = trust_levels.high_trust
	elif trust_target_name == "player":
		current_player_trust += 1
		if current_player_trust > trust_levels.high_trust:
			current_player_trust = trust_levels.high_trust

func decrease_trust_level(trust_target_name: String):
	if trust_target_name == "artsy":
		current_artsy_trust -= 1
		if current_artsy_trust < trust_levels.distrust:
			current_artsy_trust = trust_levels.distrust
	elif trust_target_name == "jock":
		current_jock_trust -= 1
		if current_jock_trust < trust_levels.distrust:
			current_jock_trust = trust_levels.distrust
	elif trust_target_name == "nerd":
		current_nerd_trust -= 1
		if current_nerd_trust < trust_levels.distrust:
			current_nerd_trust = trust_levels.distrust
	elif trust_target_name == "mean":
		current_mean_trust -= 1
		if current_mean_trust < trust_levels.distrust:
			current_mean_trust = trust_levels.distrust
	elif trust_target_name == "nice":
		current_nice_trust -= 1
		if current_nice_trust < trust_levels.distrust:
			current_nice_trust = trust_levels.distrust
	elif trust_target_name == "player":
		current_player_trust -= 1
		if current_player_trust < trust_levels.distrust:
			current_player_trust = trust_levels.distrust
		
func change_trust_level(trust_target_name: String, change_in_trust: int):
	if trust_target_name == "artsy":
		current_artsy_trust += change_in_trust
		if current_artsy_trust > trust_levels.high_trust:
			current_artsy_trust = trust_levels.high_trust
		elif current_player_trust < trust_levels.distrust:
			current_player_trust = trust_levels.distrust
	elif trust_target_name == "jock":
		current_jock_trust += change_in_trust
		if current_jock_trust > trust_levels.high_trust:
			current_jock_trust = trust_levels.high_trust
		elif current_player_trust < trust_levels.distrust:
			current_player_trust = trust_levels.distrust
	elif trust_target_name == "nerd":
		current_nerd_trust += change_in_trust
		if current_nerd_trust > trust_levels.high_trust:
			current_nerd_trust = trust_levels.high_trust
		elif current_player_trust < trust_levels.distrust:
			current_player_trust = trust_levels.distrust
	elif trust_target_name == "mean":
		current_mean_trust += change_in_trust
		if current_mean_trust > trust_levels.high_trust:
			current_mean_trust = trust_levels.high_trust
		elif current_player_trust < trust_levels.distrust:
			current_player_trust = trust_levels.distrust
	elif trust_target_name == "nice":
		current_nice_trust += change_in_trust
		if current_nice_trust > trust_levels.high_trust:
			current_nice_trust = trust_levels.high_trust
		elif current_player_trust < trust_levels.distrust:
			current_player_trust = trust_levels.distrust
	elif trust_target_name == "player":
		current_player_trust += change_in_trust
		if current_player_trust > trust_levels.high_trust:
			current_player_trust = trust_levels.high_trust
		elif current_player_trust < trust_levels.distrust:
			current_player_trust = trust_levels.distrust

func set_trust_level(trust_target_name: String, new_trust_level: trust_levels):
	if trust_target_name == "artsy":
		current_artsy_trust = new_trust_level
	elif trust_target_name == "jock":
		current_jock_trust = new_trust_level
	elif trust_target_name == "nerd":
		current_nerd_trust = new_trust_level
	elif trust_target_name == "mean":
		current_mean_trust = new_trust_level
	elif trust_target_name == "nice":
		current_nice_trust = new_trust_level
	elif trust_target_name == "player":
		current_player_trust = new_trust_level

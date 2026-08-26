class_name Opponent extends Node

@export var opponent_name: String

var current_trust: int = 0
enum trust_levels {distrust = -2, low_distrust = -1, no_trust = 0, low_trust = 1, high_trust = 2}

func increase_trust_level():
	current_trust += 1
	if current_trust > trust_levels.high_trust:
		current_trust = trust_levels.high_trust

func decrease_trust_level():
	current_trust -= 1
	if current_trust < trust_levels.distrust:
		current_trust = trust_levels.distrust
		
func change_trust_level(change_in_trust: int):
	change_in_trust += change_in_trust
	
	if current_trust > trust_levels.high_trust:
		current_trust = trust_levels.high_trust
	elif current_trust < trust_levels.distrust:
		current_trust = trust_levels.distrust

func set_trust_level(new_trust_level: trust_levels):
	current_trust = new_trust_level

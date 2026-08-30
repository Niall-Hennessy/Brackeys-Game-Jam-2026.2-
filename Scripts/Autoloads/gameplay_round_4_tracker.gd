extends Node

var has_medical_card: bool = false
var found_means_item: bool = false

var medical_card_ref: Node3D
var means_item_ref: Node3D

var convinced_jock_to_not_vote_you: bool = false
var convinced_mean_to_not_vote_you: bool = false
var convinced_nerd_to_not_vote_you: bool = false
var convinced_nice_to_not_vote_you: bool = false

var artsy_vote_target: String
var jock_vote_target: String
var mean_vote_target: String
var nice_vote_target: String
var nerd_vote_target: String
var player_vote_target: String

var num_artsy_votes: int = 0
var num_jock_votes: int = 0
var num_mean_votes: int = 0
var num_nice_votes: int = 0
var num_nerd_votes: int = 0
var num_player_votes: int = 0

var player_dodge_target: String = ""

var artsy_lives: int = 3
var jock_lives: int = 3
var mean_lives: int = 3
var nice_lives: int = 3
var nerd_lives: int = 3
var player_lives: int = 3

func set_has_medical_card(to_set_as: bool):
	has_medical_card = to_set_as
	if medical_card_ref:
		medical_card_ref.queue_free()
	
func set_found_means_item(to_set_as: bool):
	found_means_item = to_set_as
	if means_item_ref:
		means_item_ref.queue_free()

func set_convinced_jock_to_not_vote_you(to_set_as: bool):
	convinced_jock_to_not_vote_you = to_set_as

func set_convinced_mean_to_not_vote_you(to_set_as: bool):
	convinced_mean_to_not_vote_you = to_set_as

func set_convinced_nerd_to_not_vote_you(to_set_as: bool):
	convinced_nerd_to_not_vote_you = to_set_as
	
func set_convinced_nice_to_not_vote_you(to_set_as: bool):
	convinced_nice_to_not_vote_you = to_set_as

func get_round_3_data():
	has_medical_card = GameplayRound3Tracker.has_medical_card
	found_means_item = GameplayRound3Tracker.found_means_item
	
	medical_card_ref = GameplayRound3Tracker.medical_card_ref
	means_item_ref = GameplayRound3Tracker.means_item_ref

##########GAMEPLAY CODE############
func set_player_vote_target(vote_target: String):
	player_vote_target = vote_target

func set_player_dodge_target(dodge_target: String):
	player_dodge_target = dodge_target

func run_round_votes():
	calculate_vote_targets()
	
	if artsy_vote_target == "player":
		if player_dodge_target != "artsy":
			player_lives -= 1
		
		num_player_votes += 1
	
	if jock_vote_target == "player": 
		if player_dodge_target != "jock":
			player_lives -= 1
		
		num_player_votes += 1
	
	if mean_vote_target == "player": 
		if player_dodge_target != "mean":
			player_lives -= 1
		
		num_player_votes += 1
		
	if nerd_vote_target == "player": 
		if player_dodge_target != "nerd":
			player_lives -= 1
		
		num_player_votes += 1
		
	if nice_vote_target == "player": 
		if player_dodge_target != "nice":
			player_lives -= 1
		
		num_player_votes += 1
		
	if player_vote_target == "artsy":
		num_artsy_votes += 1
	elif  player_vote_target == "jock":
		num_jock_votes += 1
		jock_lives -= 1
	elif  player_vote_target == "mean":
		num_mean_votes += 1
		mean_lives -= 1
	elif  player_vote_target == "nice":
		num_nice_votes += 1
		nice_lives -= 1
	elif  player_vote_target == "nerd":
		num_nerd_votes += 1
		nerd_lives -= 1

func reset_num_votes():
	num_artsy_votes = 0
	num_jock_votes = 0
	num_mean_votes = 0
	num_nice_votes = 0
	num_nerd_votes = 0
	num_player_votes = 0

func calculate_vote_targets():
	reset_num_votes()
	
	if OpponentStatusTracker.jock_is_alive:
		if player_lives == 3:
			artsy_vote_target = "jock"
		else:
			artsy_vote_target = "player"
		
		if convinced_jock_to_not_vote_you:
			jock_vote_target = "artsy"
		else:
			jock_vote_target = "player"
					
	elif OpponentStatusTracker.mean_is_alive:
		if player_lives == 3:
			artsy_vote_target = "mean"
		else:
			artsy_vote_target = "player"
		
		if convinced_mean_to_not_vote_you:
			mean_vote_target = "artsy"
		else:
			mean_vote_target = "player"
			
	elif OpponentStatusTracker.nerd_is_alive:
		if player_lives == 3:
			artsy_vote_target = "nerd"
		else:
			artsy_vote_target = "player"
		
		if convinced_nerd_to_not_vote_you:
			nerd_vote_target = "artsy"
		else:
			nerd_vote_target = "player"
			
	elif OpponentStatusTracker.nice_is_alive:
		if player_lives == 3:
			artsy_vote_target = "nice"
		else:
			artsy_vote_target = "player"
		
		if convinced_nice_to_not_vote_you:
			nice_vote_target = "artsy"
		else:
			nice_vote_target = "player"

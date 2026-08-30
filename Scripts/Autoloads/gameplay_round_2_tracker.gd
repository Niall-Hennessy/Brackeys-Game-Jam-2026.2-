extends Node

var has_medical_card: bool = false
var found_means_item: bool = false

var medical_card_ref: Node3D
var means_item_ref: Node3D

var convinced_jock_to_not_vote_you: bool = false
var convinced_mean_to_not_vote_you: bool = false

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

func get_round_1_data():
	has_medical_card = GameplayRound1Tracker.has_medical_card
	found_means_item = GameplayRound1Tracker.found_means_item
	
	medical_card_ref = GameplayRound1Tracker.medical_card_ref
	means_item_ref = GameplayRound1Tracker.means_item_ref

##########GAMEPLAY CODE############
func set_player_vote_target(vote_target: String):
	player_vote_target = vote_target

func set_player_dodge_target(dodge_target: String):
	player_dodge_target = dodge_target

func run_round_votes():
	calculate_vote_targets()
	
	if artsy_vote_target == "player": #Artsy only votes player
		if player_dodge_target != "artsy":
			player_lives -= 1
		
		num_player_votes += 1
		
	if mean_vote_target == "player":
		if player_dodge_target != "mean":
			player_lives -= 1
			
		num_player_votes += 1
	elif mean_vote_target == "jock":
		jock_lives -= 1
		num_jock_votes += 1
	elif mean_vote_target == "nice":
		nice_lives -= 1
		num_nice_votes += 1
	
	if jock_vote_target == "player":
		if player_dodge_target != "jock":
			player_lives -= 1
		num_player_votes += 1
	elif jock_vote_target == "mean":
		print("Test 2")
		mean_lives -= 1 
		num_mean_votes += 1
	elif jock_vote_target == "nerd":
		nerd_lives -= 1 
		num_nerd_votes += 1
		
	if nice_vote_target == "nerd":
		nerd_lives -= 1
		num_nerd_votes += 1
	elif nice_vote_target == "mean":
		mean_lives -= 1
		num_mean_votes += 1
	
	if nerd_vote_target == "jock":
		jock_lives -= 1
		num_jock_votes += 1
	elif nerd_vote_target == "nice":
		nice_lives -= 1
		num_nice_votes += 1
		
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
	
	artsy_vote_target = "player"
	
	if OpponentStatusTracker.nerd_is_alive:
		nice_vote_target = "nerd"
	else:
		nice_vote_target = "mean"
		
	if OpponentStatusTracker.nice_is_alive:
		nerd_vote_target = "nice"
	else:
		nerd_vote_target = "jock"
		
	if convinced_jock_to_not_vote_you:
		if OpponentStatusTracker.mean_is_alive:
			jock_vote_target = "mean"
		else:
			jock_vote_target = "nerd"
	else:
		jock_vote_target = "player"
	
	if convinced_mean_to_not_vote_you:
		if OpponentStatusTracker.jock_is_alive:
			mean_vote_target = "jock"
		else:
			mean_vote_target = "nice"
	else:
		mean_vote_target = "player"

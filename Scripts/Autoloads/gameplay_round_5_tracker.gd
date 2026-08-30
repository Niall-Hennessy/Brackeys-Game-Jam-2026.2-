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

func get_round_4_data():
	has_medical_card = GameplayRound4Tracker.has_medical_card
	found_means_item = GameplayRound4Tracker.found_means_item
	
	medical_card_ref = GameplayRound4Tracker.medical_card_ref
	means_item_ref = GameplayRound4Tracker.means_item_ref

##########GAMEPLAY CODE############
func set_player_vote_target(vote_target: String):
	player_vote_target = vote_target

func set_player_dodge_target(dodge_target: String):
	player_dodge_target = dodge_target

func run_round_votes():
	calculate_vote_targets()

func reset_num_votes():
	num_artsy_votes = 0
	num_jock_votes = 0
	num_mean_votes = 0
	num_nice_votes = 0
	num_nerd_votes = 0
	num_player_votes = 0

func calculate_vote_targets():
	reset_num_votes()
	
	if OpponentStatusTracker.artsy_is_alive:
		artsy_vote_target = "fall"
		
	elif OpponentStatusTracker.jock_is_alive:
		jock_vote_target = "trust"
					
	elif OpponentStatusTracker.mean_is_alive:
		mean_vote_target = "trust"
			
	elif OpponentStatusTracker.nerd_is_alive:
		nerd_vote_target = "trust"
			
	elif OpponentStatusTracker.nice_is_alive:
		nice_vote_target = "trust"

extends Node

var has_medical_card: bool = false
var found_means_item: bool = false

var convinced_nice_to_participate: bool = false

var convinced_jock_to_not_vote_you: bool = false
var convinced_mean_to_not_vote_you: bool = false

var artsy_vote_target: String  = "player"
var jock_vote_target: String = "player"
var mean_vote_target: String = "player"
var nice_vote_target: String = "no one"
var nerd_vote_target: String = "jock"
var player_vote_target: String = ""

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

func set_convinced_nice_to_participate(to_set_as: bool):
	convinced_nice_to_participate = to_set_as
	
func set_found_means_item(to_set_as: bool):
	found_means_item = to_set_as

func set_convinced_jock_to_not_vote_you(to_set_as: bool):
	convinced_jock_to_not_vote_you = to_set_as

func set_convinced_mean_to_not_vote_you(to_set_as: bool):
	convinced_mean_to_not_vote_you = to_set_as


##########GAMEPLAY CODE############
func set_player_vote_target(vote_target: String):
	player_vote_target = vote_target

func set_player_dodge_target(dodge_target: String):
	player_dodge_target = dodge_target

func run_round_votes():
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
	
	if jock_vote_target == "player":
		if player_dodge_target != "jock":
			player_lives -= 1
		num_player_votes += 1
	elif jock_vote_target == "mean":
		mean_lives -= 1 
		num_mean_votes += 1
		
	if nice_vote_target == "no one":
		nice_lives -= 2
	elif nice_vote_target == "nerd":
		nerd_lives -= 1
		num_nerd_votes += 1
	
	if nerd_vote_target == "jock":
		jock_lives -= 1
		num_jock_votes += 1

func reset_num_votes():
	num_artsy_votes = 0
	num_jock_votes = 0
	num_mean_votes = 0
	num_nice_votes = 0
	num_nerd_votes = 0
	num_player_votes = 0

func calculate_second_round_vote_targets():
	reset_num_votes()
	
	artsy_vote_target = "player"
	jock_vote_target = "player"

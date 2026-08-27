extends Node

func _ready() -> void:
	InteractPhaseManager.opponent_artsy = %OpponentArtsy
	InteractPhaseManager.opponent_jock = %OpponentJock
	InteractPhaseManager.opponent_nerd = %OpponentNerd
	InteractPhaseManager.opponent_mean = %OpponentMean
	InteractPhaseManager.opponent_nice = %OpponentNice

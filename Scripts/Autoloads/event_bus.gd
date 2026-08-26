extends Node

signal progress_phase_timer
signal progress_to_next_phase

signal phase_timer_updated(current_time: int)
signal phase_updated

signal opponent_interacted(current_opponent: int)

signal entered_cutscene_phase
signal entered_interact_phase
signal entered_gameplay_phase
#signal object_interacted(interactable:Node3D)

signal bridge_segment_dropped(bridge_number: int, segment_number: int)

signal artsy_dies
signal jock_dies
signal nerd_dies
signal mean_dies
signal nice_dies

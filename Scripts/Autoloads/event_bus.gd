extends Node

signal progress_phase_timer
signal progress_to_next_phase

signal phase_timer_updated(current_time: int)
signal phase_updated

signal opponent_interacted(current_opponent: int)

signal entered_cutscene_phase
signal entered_interact_phase
signal entered_gameplay_phase

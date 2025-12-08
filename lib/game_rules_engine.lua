-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.

GAME_RULES_ENGINE = {}
function GAME_RULES_ENGINE.on_game_over()
	if GAME_RULES_ENGINE.on_game_over_callback then
		GAME_RULES_ENGINE.on_game_over_callback()
	end
end

function GAME_RULES_ENGINE.on_pre_next_game_step()
	if GAME_RULES_ENGINE.on_pre_next_game_step_callback then
		GAME_RULES_ENGINE.on_pre_next_game_step_callback()
	end
end

function GAME_RULES_ENGINE.on_next_game_step()
	if GAME_RULES_ENGINE.on_next_game_step_callback then
		GAME_RULES_ENGINE.on_next_game_step_callback()
	end
end

function GAME_RULES_ENGINE.on_new_game(delay)
	if GAME_RULES_ENGINE.on_new_game_callback then
		GAME_RULES_ENGINE.on_new_game_callback(delay)
	end
end

function GAME_RULES_ENGINE.on_restart_game()
	if GAME_RULES_ENGINE.on_restart_game_callback then
		GAME_RULES_ENGINE.on_restart_game_callback()
	end
end

function GAME_RULES_ENGINE.on_camera_arrived()
	if GAME_RULES_ENGINE.on_camera_arrived_callback then
		GAME_RULES_ENGINE.on_camera_arrived_callback()
	end
end

function GAME_RULES_ENGINE.on_player_stats_updated()
	if GAME_RULES_ENGINE.on_player_stats_updated_callback then
		GAME_RULES_ENGINE.on_player_stats_updated_callback()
	end
end

function GAME_RULES_ENGINE.on_pre_next_level()
	if GAME_RULES_ENGINE.on_pre_next_level_callback then
		GAME_RULES_ENGINE.on_pre_next_level_callback()
	end
end

function GAME_RULES_ENGINE.on_next_level()
	if GAME_RULES_ENGINE.on_next_level_callback then
		GAME_RULES_ENGINE.on_next_level_callback()
	end
end

function GAME_RULES_ENGINE.on_player_stats_updated(player_stats)
	if GAME_RULES_ENGINE.on_player_stats_updated_callback then
		GAME_RULES_ENGINE.on_player_stats_updated_callback(player_stats)
	end
end

function GAME_RULES_ENGINE.on_window_event(lock_window_screen_manager)
	if GAME_RULES_ENGINE.on_window_event_callback then
		GAME_RULES_ENGINE.on_window_event_callback(lock_window_screen_manager)
	end
end

function GAME_RULES_ENGINE.configure(on_new_game_callback,
									 on_restart_game_callback,
									 on_next_game_step_callback,
									 on_pre_next_game_step_callback,
									 on_game_over_callback,
									 on_camera_arrived_callback,
									 on_player_stats_updated_callback,
									 on_pre_next_level,
									 on_next_level_callback,
									 on_window_event_callback)
	GAME_RULES_ENGINE.on_new_game_callback = on_new_game_callback
	GAME_RULES_ENGINE.on_restart_game_callback = on_restart_game_callback
	GAME_RULES_ENGINE.on_game_over_callback = on_game_over_callback
	GAME_RULES_ENGINE.on_next_game_step_callback = on_next_game_step_callback
	GAME_RULES_ENGINE.on_pre_next_game_step_callback = on_pre_next_game_step_callback
	GAME_RULES_ENGINE.on_camera_arrived_callback = on_camera_arrived_callback
	GAME_RULES_ENGINE.on_player_stats_updated_callback = on_player_stats_updated_callback
	GAME_RULES_ENGINE.on_pre_next_level = on_pre_next_level
	GAME_RULES_ENGINE.on_next_level_callback = on_next_level_callback
	GAME_RULES_ENGINE.on_window_event_callback = on_window_event_callback
end
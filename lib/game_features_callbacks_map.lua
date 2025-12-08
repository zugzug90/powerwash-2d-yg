-- pluggable customiszable set of game features

local function restore_bg_music_sounds(self)
    msg.post(SOUND_MANAGER_ID, MSG_SOUND_STOP_RAW, {sound_id = "game_powerup_duration_music"})
    --[[msg.post(SOUND_MANAGER_ID, MSG_SOUND_STOP_RAW, {sound_id = "bg_music"})
    timer.delay(0, false, function()
        msg.post(SOUND_MANAGER_ID, MSG_SOUND_PLAY_RAW, {sound_id = "bg_music"})
    end)]]
end

local game_features_callbacks_map = {
    player_context_map = {}
}

game_features_callbacks_map.powerup_1 = {
    name = 'PowerUp1',
    callback = function(self, feature_id, player_context_map, cancellation_predicate_function)
        local multiplier_factor = 2.75
        local laser_energy_decrease_factor = 0.5
        local duration_seconds = 15
        local self_root = self

        PLAYER_DATA.game_powerup_mode = true
        game_features_callbacks_map.player_context_map = player_context_map

        --msg.post(SOUND_MANAGER_ID, MSG_SOUND_STOP_RAW, {sound_id = "bg_music"})
        msg.post(SOUND_MANAGER_ID, MSG_SOUND_PLAY_RAW, {sound_id = "game_powerup_duration_music"})

        PLAYER_DATA.player_improvements.laser_power_level_multiplier = PLAYER_DATA.player_improvements.laser_power_level_multiplier * multiplier_factor
        PLAYER_DATA.laser_power_decrease_multiplier = laser_energy_decrease_factor

        msg.post(OBJ_PLAYER_ID, MSG_UPDATE_GAME_FEATURE_STATS, {feature_id = feature_id, duration_seconds_left = duration_seconds, feature_started = true})

        PLAYER_DATA.weapon_stats.laser_energy = player_context_map.player_battery_capacity_level

        local timer_handle = timer.delay(0.1, true, function(self, timer_id, time_elapsed)

            msg.post(GUI_ID, MSG_GUI_UPDATE_GAME_FEATURE_STATS_RAW, {feature_id = feature_id, duration_seconds_left = duration_seconds})

            if duration_seconds <= 0 or cancellation_predicate_function(self_root, feature_id, player_context_map, duration_seconds) == true then
                PLAYER_DATA.weapon_stats.laser_energy = player_context_map.player_current_laser_energy

                PLAYER_DATA.player_improvements.laser_power_level_multiplier = 1
                PLAYER_DATA.laser_power_decrease_multiplier = 1

                restore_bg_music_sounds(self)

                msg.post(GUI_ID, MSG_GUI_UPDATE_GAME_FEATURE_STATS_RAW, {feature_id = feature_id, duration_seconds_left = duration_seconds, feature_stopped = true})
                msg.post(OBJ_PLAYER_ID, MSG_UPDATE_GAME_FEATURE_STATS, {feature_id = feature_id, duration_seconds_left = duration_seconds, feature_stopped = true})

                timer.cancel(timer_id)
                PLAYER_DATA.game_powerup_mode = false

                msg.post(GUI_ID, MSG_UPDATE_WEAPON_STATS, PLAYER_DATA.weapon_stats)
            end
            duration_seconds = duration_seconds - 0.1
        end)
    end,
    stop_callback = function(self, feature_id)

        PLAYER_DATA.weapon_stats.laser_energy = game_features_callbacks_map.player_context_map.player_current_laser_energy
        restore_bg_music_sounds(self)
        PLAYER_DATA.player_improvements.laser_power_level_multiplier = 1
        PLAYER_DATA.laser_power_decrease_multiplier = 1
        PLAYER_DATA.game_powerup_mode = false
        msg.post(GUI_ID, MSG_GUI_UPDATE_GAME_FEATURE_STATS_RAW, {feature_id = feature_id, duration_seconds_left = 0, feature_stopped = true})
    end
}


game_features_callbacks_map.powerup_2 = {
    name = 'PowerUp2',
    callback = function(self, feature_id)

    end
}

game_features_callbacks_map.powerup_3 = {
    name = 'PowerUp3',
    callback = function(self, feature_id)

    end
}

return game_features_callbacks_map
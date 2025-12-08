local level_thresholds = { 1, 2, 3, 4, 5, 6, 7, 10, 11, 15, 16, 17, 20, 21, 25, 32, 35, 47}
local player_progression_level_thresholds = { 2, 3, 4, 5, 6, 7, 10, 20, 35, 47}

local analytics_manager = {

    send_level_progression_metrics = function(type, level_id)
        pcall(function()

            if gameanalytics then 
                if level_thresholds[level_id] then
                    gameanalytics.addProgressionEvent {
                        progressionStatus = type,
                        progression01 = "world01",
                        progression02 = "stage01",
                        progression03 = tostring(level_id)
                    }
                end
            end
            
        end)
    end,

    send_player_progression_metrics = function(player_progression_name, progression_upgrade_action_id, level_id)
        pcall(function()

            if player_progression_level_thresholds[level_id] then
                print('gameanalytics.addProgressionEvent', player_progression_name, level_id)
                if gameanalytics then 
                    gameanalytics.addProgressionEvent {
                        progressionStatus = 'Complete',
                        progression01 = "player_stats",
                        progression02 = player_progression_name,
                        progression03 = tostring(level_id)
                    }   
                end

            end
        end)
    end,

    send_game_feature_used = function(feature_id)

    end,

    send_game_action_done = function(action_id, key, value)

    end
}

return analytics_manager
require "lib.game_config"
require "lib.game_constants"

local game_feature_spawn_manager = {

}

game_feature_spawn_manager.spawn_game_feature_if_needed = function(self, player_data)

    if player_data.game_features_spawn.spawn_counter % player_data.game_features_spawn.spawn_factor == 0 then
        msg.post(GUI_ID, MSG_GUI_SPAWN_GAME_FEATURE_RAW, {feature_id = 'powerup_1', delay = 4,
                                                          feature_icon_sprite_id = 'laser_double_power_icon'})

    end
    player_data.game_features_spawn.spawn_counter = player_data.game_features_spawn.spawn_counter + 1
end

return game_feature_spawn_manager
require "lib.game_config"
require "lib.game_constants"
local sound_manager = require "lib.sound_manager"

local game_features_manager = {
    show_duration = 2
}

-- Init callbacks which will be called during game feature activation guarded with rewarded ad lock
game_features_manager.init_game_feature_callbacks = function(disable_game_feature_rewarded_ad, enable_game_feature_button, on_activate_feature_callback)
    game_features_manager.disable_game_feature_rewarded_ad = disable_game_feature_rewarded_ad
    game_features_manager.enable_game_feature_button = enable_game_feature_button
    game_features_manager.on_activate_feature_callback = on_activate_feature_callback
end

-- Init callbacks which will be called during improvement feature activation conditionally guarded with rewarded ad lock
game_features_manager.init_improvement_feature_callbacks = function(disable_rewarded_ads, upgrade_player_stat_level_if_possible, update_cost_label_for_all_buttons)
    game_features_manager.disable_rewarded_ads = disable_rewarded_ads
    game_features_manager.upgrade_player_stat_level_if_possible = upgrade_player_stat_level_if_possible
    game_features_manager.update_cost_label_for_all_buttons = update_cost_label_for_all_buttons
end

game_features_manager.unlock_game_feature = function(self, feature_id)
    game_features_manager.disable_game_feature_rewarded_ad(self, feature_id)
    game_features_manager.enable_game_feature_button(self, feature_id)

    print('self.game_feature_buttons[feature_id].unlocked = true', feature_id)
    self.game_feature_buttons[feature_id].unlocked = true
    --turn_on_sounds_back_if_needed(self)
end

game_features_manager.unlock_improvement_feature = function(self, feature_id)
    game_features_manager.disable_rewarded_ads(self)
    game_features_manager.upgrade_player_stat_level_if_possible(self, feature_id, true)
    game_features_manager.update_cost_label_for_all_buttons(self)
    --turn_on_sounds_back_if_needed(self)
end

game_features_manager.resolve_feature_id_to_unlock_feature_callback = function (self, feature_id)
    if self.improvement_buttons and self.improvement_buttons[feature_id] then
        return game_features_manager.unlock_improvement_feature
    elseif self.game_feature_buttons and self.game_feature_buttons[feature_id] then
        return game_features_manager.unlock_game_feature
    end
    print('[WARN] No unlock_feature_callback found for feature id: ', feature_id)
    return nil
end

game_features_manager.unlock_feature = function(self, feature_text, feature_id)
    local root_self = self
    local game_notification_rewards_box = gui.get_node("game_notification_rewards_box")
    gui.set_text(gui.get_node("game_notification_rewards_label"), feature_text)

    gui.set_position(game_notification_rewards_box, RECORD_RIBBON_WEST_HIDDEN_POS)

    gui.animate(game_notification_rewards_box, gui.PROP_POSITION, RECORD_RIBBON_CENTER_POS, gui.EASING_LINEAR, 0.4, 0.0, function(self, node)

        local callback = game_features_manager.resolve_feature_id_to_unlock_feature_callback(self, feature_id)
        sound_manager.turn_on_sounds_back_if_needed()
        callback(root_self, feature_id)

        gui.animate(game_notification_rewards_box, gui.PROP_POSITION, RECORD_RIBBON_EAST_POS, gui.EASING_LINEAR, 0.4, game_features_manager.show_duration, function(self, node)
            print('[game_features_manager.unlock_feature] turn_on_sounds_back_if_needed()')
            msg.post(GUI_ID, MSG_GUI_UNLOCK_CONTROLS_RAW)
            sound_manager.turn_on_sounds_back_if_needed()
        end, gui.PLAYBACK_ONCE_FORWARD)
    end, gui.PLAYBACK_ONCE_FORWARD)
end

game_features_manager.activate_feature_via_rewarded_ad = function(self, button_id, rewarded_ad_flow_initiator_gui_id)
    GAME_RULES_ENGINE.on_window_event(true)
    if self.game_feature_buttons and self.game_feature_buttons[button_id].unlocked == true then
        if self.game_feature_buttons[button_id].activated == false then
            self.game_feature_buttons[button_id].activated = true
            GAME_RULES_ENGINE.on_window_event(false)
            game_features_manager.on_activate_feature_callback(self, button_id)
        end
    else
        sound_manager.pause_sounds_if_needed()
        msg.post(GUI_ID, MSG_GUI_LOCK_CONTROLS_RAW)
        msg.post(MAIN_CONTROLLER_ID, MSG_PLAY_REWARDED_AD_RAW, {feature_id = button_id, rewarded_ad_flow_initiator_gui_id = rewarded_ad_flow_initiator_gui_id})
    end

end

return game_features_manager
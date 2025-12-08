require "lib.game_constants"
require "lib.game_config"

local monarch = require("monarch.monarch")

local function resolve_msg_sender(recipient_id)
    local sender = monarch
    if type(recipient_id) == 'string' then
        sender = msg
    end

    return sender
end

local monetization_callbacks_handler = {

    rewarded_ad_flow_initiator_gui_id = nil,
    current_feature_id = nil,

    rewarded_open = function(self)
        -- You should switch off all sounds!
        msg.post(GUI_ID, MSG_GUI_LOCK_CONTROLS_RAW)
    end,

    rewarded_rewarded = function(self)
    end
}

monetization_callbacks_handler.rewarded_close = function()
    local sender = resolve_msg_sender(monetization_callbacks_handler.rewarded_ad_flow_initiator_gui_id)

    sender.post(--[[hash("restart_and_next_level_game_screen")]]monetization_callbacks_handler.rewarded_ad_flow_initiator_gui_id, MSG_REWARD_GRANTED_RAW, {feature_id = monetization_callbacks_handler.current_feature_id})

    msg.post(GUI_ID, MSG_GUI_UNLOCK_CONTROLS_RAW)
end

monetization_callbacks_handler.rewarded_error = function(err)
    local sender = resolve_msg_sender(monetization_callbacks_handler.rewarded_ad_flow_initiator_gui_id)
    sender.post(--[[hash("restart_and_next_level_game_screen")]]monetization_callbacks_handler.rewarded_ad_flow_initiator_gui_id, MSG_REWARD_GRANTED_RAW, {feature_id = monetization_callbacks_handler.current_feature_id})
end

monetization_callbacks_handler.show_rewarded_ad = function(games_platform_integration, feature_id, rewarded_ad_flow_initiator_gui_id)
    monetization_callbacks_handler.current_feature_id = feature_id
    monetization_callbacks_handler.rewarded_ad_flow_initiator_gui_id = rewarded_ad_flow_initiator_gui_id
    games_platform_integration.show_rewarded_ad(monetization_callbacks_handler.rewarded_open, monetization_callbacks_handler.rewarded_rewarded, monetization_callbacks_handler.rewarded_close, monetization_callbacks_handler.rewarded_error)
end

return monetization_callbacks_handler
local sound_manager = {
    turn_on_sounds = function ()
        print('turn_on_sounds')
        msg.post(SOUND_MANAGER_ID, MSG_SOUND_ON)
        msg.post(SOUND_MANAGER_ID, MSG_SOUND_RESUME_RAW, {sound_id = "game_powerup_duration_music"})
    end,

    pause_sounds_if_needed = function()
        if PLAYER_DATA.sounds_off == false then
            msg.post(SOUND_MANAGER_ID, MSG_SOUND_OFF_RAW)

            msg.post(SOUND_MANAGER_ID, MSG_SOUND_PAUSE_RAW, {sound_id = "game_powerup_duration_music"})
            msg.post(SOUND_MANAGER_ID, MSG_SOUND_PAUSE_RAW, {sound_id = "level_complete_bell_sound"})
        end
    end
}

sound_manager.turn_on_sounds_back_if_needed = function()
    if PLAYER_DATA.sounds_off == false then
        sound_manager.turn_on_sounds()
    end
end

return sound_manager
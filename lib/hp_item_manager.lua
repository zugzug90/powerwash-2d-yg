math.randomseed(os.time())
math.random();math.random();math.random(); -- discards first few RNG number

local hp_item_manager = {
    -- chance of 0.5 works only once per session (per game launch)
    chance = 0.5,
    lowered_chance = 0.33,
    generated_count = 0
}

function hp_item_manager.reset()
    hp_item_manager.generated_count = 0
end

function hp_item_manager.is_new_hp_item(player_state)
    if not player_state.game_actions or player_state.game_actions == 0 then
        return false
    end
    if hp_item_manager.generated_count > 0 then
        return false
    end
    if math.random() > (1 - hp_item_manager.chance) then
        hp_item_manager.generated_count = hp_item_manager.generated_count + 1
        hp_item_manager.chance = (1 - hp_item_manager.lowered_chance)
        return true
    end

    return false
end

return hp_item_manager
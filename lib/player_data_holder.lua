PLAYER_DATA = {}
PLAYER_DATA.game_actions = 0
PLAYER_DATA.sounds_off = false
PLAYER_DATA.hp = 0
PLAYER_DATA.touches_count = 0
PLAYER_DATA.music_started = false
PLAYER_DATA.current_level = 1

PLAYER_DATA.default_player_improvements = {
    laser_power_level = 1,
    battery_capacity_level = 1,
    money_per_tile_earning_level = 1,
    laser_power_level_multiplier = 1
}

PLAYER_DATA.player_improvements = PLAYER_DATA.default_player_improvements

PLAYER_DATA.game_powerup_mode = false

PLAYER_DATA.weapon_stats = {

    money_earned = 0
}

PLAYER_DATA.laser_power_decrease_multiplier = 1

PLAYER_DATA.game_features_spawn = {
    -- making spawn_counter at value 2, so next re-start / level will trigger powerup game feature appearance
    spawn_counter = 2,
    -- spawn powerup game feature each N_th time: currently each 3rd level/restart
    spawn_factor = 3
}

PLAYER_DATA.current_level = 1
PLAYER_DATA.level_completed_state = false

PLAYER_DATA.improvement_buttons_should_be_locked_with_rewarded_ads = false

PLAYER_DATA.improvement_features_spawn = {
    -- making spawn_counter at value 1, so after 3 re-starts / level will trigger improvement ad lock feature appearance
    spawn_counter = 1,
    -- spawn powerup game feature each N_th time: currently each 3rd level/restart
    spawn_factor = 4
}

PLAYER_DATA.locale = 'ru'
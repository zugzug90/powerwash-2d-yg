local player_improvements_manager = {}

player_improvements_manager.progression = {
    laser_power_levels = {
        1, 1.1, 1.2, 1.225, 1.25, 1.3, 1.325, 1.4, 1.475, 1.5, 1.525, 1.55, 1.575, 1.6, 1.625, 1.65, 1.675, 1.7, 1.725, 1.75, 1.775, 1.8, 1.825, 1.85, 1.875, 1.876, 1.877, 1.878, 1.879, 1.88, 1.881, 1.882, 1.883, 1.884, 1.885, 1.886, 1.887, 1.888, 1.889, 1.9
    },
    battery_capacity_levels = {
        20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59
    },
    money_per_tile_earning_levels = {
        1, 1.25, 1.5, 1.75, 2, 2.25, 2.5, 2.75, 3, 3.25, 3.5, 3.75, 4, 4.1, 4.2, 4.3, 4.4, 4.5, 4.6, 4.7, 4.8, 4.9, 5, 5.1, 5.2, 5.3, 5.4, 5.5, 5.6, 5.7, 5.8, 5.9, 6, 6.1, 6.2, 6.3, 6.4, 6.5, 7, 8
    }
}

player_improvements_manager.progression_costs = {
    laser_power_levels = {
        10, 12, 14, 17, 20, 24, 29, 35, 42, 51, 61,	74,	89,	106, 127, 152, 182, 218, 262, 314, 377, 452, 542, 650, 780, 936, 1123, 1348, 1618, 1942, 2330, 2796, 3355, 4026, 4831, 5797, 6956, 8347, 10016, 12019
    },
    battery_capacity_levels = {
        13, 13, 18, 22, 26, 32, 38, 46, 55, 67, 80, 96, 115, 138, 160, 192, 230, 270, 330, 400, 480, 595, 714, 857, 1028, 1234, 1481, 1777, 2132, 2558, 3070, 3684, 4421, 5305, 6366, 7639, 9167, 11000, 13200, 15000
    },
    money_per_tile_earning_levels = {
        15, 18, 21, 25, 31, 37, 44, 53, 64, 77, 92,	110, 132, 158, 192, 228, 274, 329, 395, 474, 569, 683, 820, 984, 1181, 1417, 1700, 2040, 2448, 2938, 3526, 4231, 5077, 6092, 7310, 8700, 10500, 12600, 15000, 18000
    }
}

--[[print('player_improvements_manager.progression.laser_power_levels', #player_improvements_manager.progression.laser_power_levels)
print('player_improvements_manager.progression.battery_capacity_levels', #player_improvements_manager.progression.battery_capacity_levels)
print('player_improvements_manager.progression.money_per_tile_earning_levels', #player_improvements_manager.progression.money_per_tile_earning_levels)

print('player_improvements_manager.progression_costs.laser_power_levels', #player_improvements_manager.progression_costs.laser_power_levels)
print('player_improvements_manager.progression_costs.battery_capacity_levels', #player_improvements_manager.progression_costs.battery_capacity_levels)
print('player_improvements_manager.progression_costs.money_per_tile_earning_levels', #player_improvements_manager.progression_costs.money_per_tile_earning_levels)]]

return player_improvements_manager
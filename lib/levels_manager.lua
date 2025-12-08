local levels_manager = {

}

local levels = {
    [1] = {
        dirt_spots = {
            [1] = {pos = {x = 240, y = 640}},
            [2] = {pos = {x = 240, y = 400}, sprite_id = 'dirt_spot_2'}
        },
        cleanable = {
            width = 512,
            height = 533
        },
        options = {
            enrich_each_spot_with_grid_of_spots_around = false
        }
    },
    [2] = {
        dirt_spots = {
            [1] = {pos = {x = 350, y = 210}, sprite_id = 'dirt_spot_3'},
            [2] = {pos = {x = 330, y = 270}},
            [3] = {pos = {x = 330, y = 110}, sprite_id = 'dirt_spot_5'},
            [4] = {pos = {x = 400, y = 300}, color = vmath.vector4(255, 255, 240, 255)}
        },
        cleanable = {
            width = 700,
            height = 218
        },
        options = {
            enrich_each_spot_with_grid_of_spots_around = false
        }
    },
    [3] = {
        dirt_spots = {
            [1] = {pos = {x = 380, y = 400}, sprite_id = 'dirt_spot_3'},
            [2] = {pos = {x = 380, y = 350}},
            [3] = {pos = {x = 390, y = 310}, sprite_id = 'dirt_spot_1', color = vmath.vector4(255, 0, 0, 255)},

            [4] = {pos = {x = 380, y = 370}, sprite_id = 'dirt_spot_2', color = vmath.vector4(0, 0, 180, 255)},
            [5] = {pos = {x = 370, y = 340}},
            [6] = {pos = {x = 380, y = 250}},
            [7] = {pos = {x = 390, y = 400}, sprite_id = 'dirt_spot_4', color = vmath.vector4(255, 255, 255, 255)},
            [8] = {pos = {x = 395, y = 140}, color = vmath.vector4(100, 100, 180, 255)},
            [9] = {pos = {x = 370, y = 400}, sprite_id = 'dirt_spot_5'},
            [10] = {pos = {x = 370, y = 270}}
        },
        cleanable = {
            width = 800,
            height = 318
        },
        options = {
            enrich_each_spot_with_grid_of_spots_around = true
        }
    }--[[ ,
    [4] = {
        dirt_spots = {
            [1] = {pos = {x = 320, y = 270}, sprite_id = 'dirt_spot_graffiti_4', color = vmath.vector4(10, 100, 5, 255)},
            [2] = {pos = {x = 350, y = 450}, sprite_id = 'dirt_spot_graffiti_2'},
            [3] = {pos = {x = 370, y = 130}, sprite_id = 'dirt_spot_graffiti_5', color = vmath.vector4(180, 0, 5, 255)},

            [4] = {pos = {x = 270, y = 470}, sprite_id = 'dirt_spot_graffiti_1'},
            [5] = {pos = {x = 350, y = 450}},
            [6] = {pos = {x = 370, y = 250}, sprite_id = 'dirt_spot_5'},
            [7] = {pos = {x = 350, y = 540}, sprite_id = 'dirt_spot_graffiti_4', color = vmath.vector4(0, 0, 180, 255)},
            [8] = {pos = {x = 420, y = 530}, sprite_id = 'dirt_spot_graffiti_2', color = vmath.vector4(255,105,180, 255)},
            [9] = {pos = {x = 340, y = 440}},
            [10] = {pos = {x = 260, y = 570}, sprite_id = 'dirt_spot_graffiti_1', color = vmath.vector4(255,170,180, 255)},
        },
        cleanable = {
            width = 680,
            height = 397,
            dirt_spot_color = vmath.vector4(0, 0, 128, 255)
        },
        options = {
            enrich_each_spot_with_grid_of_spots_around = false
        }
    } ]]
}

for i, level in ipairs(levels) do
    if not level.options or level.options.enrich_each_spot_with_grid_of_spots_around ~= false then
        local offset = 50
        local original_dirt_spots = level.dirt_spots

        local enriched_dirt_spots = {}

        for i, cell in ipairs(original_dirt_spots) do
            --pprint('cell', cell)
            local cell_north = {pos = {x = cell.pos.x, y = cell.pos.y + offset}}
            local cell_south = {pos = {x = cell.pos.x, y = cell.pos.y - offset}}

            local cell_west = {pos = {x = cell.pos.x - offset, y = cell.pos.y}}
            local cell_east = {pos = {x = cell.pos.x + offset, y = cell.pos.y}}

            local cell_north_east = {pos = {x = cell.pos.x + offset, y = cell.pos.y + offset}}
            local cell_north_west = {pos = {x = cell.pos.x - offset, y = cell.pos.y + offset}}

            local cell_south_west = {pos = {x = cell.pos.x - offset, y = cell.pos.y - offset}}
            local cell_south_east = {pos = {x = cell.pos.x + offset, y = cell.pos.y - offset}}

            enriched_dirt_spots[#enriched_dirt_spots + 1] = cell_north
            enriched_dirt_spots[#enriched_dirt_spots + 1] = cell_south
            enriched_dirt_spots[#enriched_dirt_spots + 1] = cell_west
            enriched_dirt_spots[#enriched_dirt_spots + 1] = cell_east

            enriched_dirt_spots[#enriched_dirt_spots + 1] = cell_north_east
            enriched_dirt_spots[#enriched_dirt_spots + 1] = cell_north_west
            enriched_dirt_spots[#enriched_dirt_spots + 1] = cell_south_west
            enriched_dirt_spots[#enriched_dirt_spots + 1] = cell_south_east

            enriched_dirt_spots[#enriched_dirt_spots + 1] = cell
        end
        levels[i].dirt_spots = enriched_dirt_spots
    end
end

levels_manager.get_level = function(level_number)
    return levels[level_number]
end

levels_manager.get_levels_count = function()
    return #levels
end

return levels_manager
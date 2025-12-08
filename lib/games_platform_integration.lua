--require()

local games_platform_integration = {
    user_info = {user_id = 'undefined'},
    fake_user_id = '100500',
    timeout_sec = 60,
    no_interstitial_ads_decrement_counter = 3
}

local yagames = require("yagames.yagames")

local function init_handler(self, err)
    if err then
        print('init_handler: Error')
        print("Something bad happened :(", err)
    else
        --
        -- SDK is ready!
        -- From this moment, you can use all available functions, i.e. invoke ads, get player data, etc.
        --

        -- For example, signal that the game has loaded all resources and is ready for user interaction:
        print('init_handler: Success!')
        yagames.features_loadingapi_ready()
        if games_platform_integration.init_callback then
            print('init_handler: games_platform_integration.init_callback()')
            games_platform_integration.init_callback()
        end
    end
end

games_platform_integration.show_rewarded_ad = function(rewarded_open, rewarded_rewarded, rewarded_close, rewarded_error)
    yagames.adv_show_rewarded_video({
        open = rewarded_open,
        rewarded = rewarded_rewarded,
        close = rewarded_close,
        error = rewarded_error
    })
end

games_platform_integration.get_remote_config = function(options, callback)
    pprint('games_platform_integration.get_remote_config', options)
    if jstodef then
        html5.run( 'try {console.log("' .. '[INFO] ' .. 'games_platform_integration.get_remote_config' .. '")} catch(error) {}' )
    end
    yagames.flags_get(options, callback)
end

games_platform_integration.init = function(options)
    print('games_platform_integration.init', options)
    games_platform_integration.init_callback = options.init_callback
    yagames.init(init_handler)
end

games_platform_integration.update_player_data = function(options)
    print('games_platform_integration.update_player_data', options)
    if (options.score) then
        print('updating score', options.score)
    end

    if (options.hp) then
    end

    if (options.response_callback) then
        options.response_callback({response = {}, status = {}})
    end
end

games_platform_integration.init_user_info = function(options)
    if options.debug == true then
        games_platform_integration.user_info.user_id = fake_user_id
        return games_platform_integration.user_info
    end
    -- TODO: implement integration with smth real, for example Yandex Games
end

games_platform_integration.get_user_info = function()
    return yagames.environment()
end

games_platform_integration.fetch_leaderboards = function(options)
    if (options.response_callback) then
        options.response_callback({response = {}, status = {}})
    end
    -- TODO: implement integration with smth real, for example Yandex Games
end

games_platform_integration.get_users = function(options)
    if (options.response_callback) then
        options.response_callback({response = {}, status = {}})
    end
    -- TODO: implement integration with smth real, for example Yandex Games
end

games_platform_integration.add_listener = function(js_listener)
    return {}
    -- TODO: implement integration with smth real, for example Yandex Games
end

games_platform_integration.remove_listener = function(js_listener)
    return {}
    -- TODO: implement integration with smth real, for example Yandex Games
end

games_platform_integration.show_interstitial_ad = function(before_ad_shown, adv_open, adv_close, adv_offline, adv_error, adv_skipped_by_timeout_or_rules, timeout_sec)
    if games_platform_integration.no_interstitial_ads_decrement_counter > 0 then
        games_platform_integration.no_interstitial_ads_decrement_counter = games_platform_integration.no_interstitial_ads_decrement_counter - 1
        adv_skipped_by_timeout_or_rules()
        return
    end

    local timeout_sec_effective_value = timeout_sec or games_platform_integration.timeout_sec
    if (not games_platform_integration.last_time_ad_shown or (os.time() - games_platform_integration.last_time_ad_shown) > timeout_sec_effective_value) then
        before_ad_shown()
        yagames.adv_show_fullscreen_adv({
            open = adv_open,
            close = function(self, was_shown)
                games_platform_integration.last_time_ad_shown = os.time()
                adv_close(self, was_shown)
            end,
            offline = adv_offline,
            error = adv_error
        })
    else
        adv_skipped_by_timeout_or_rules()
    end
end


return games_platform_integration


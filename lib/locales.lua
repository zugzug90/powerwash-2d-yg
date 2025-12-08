GAME_MSG_LABEL_START_GAME_PC="Зажми для прыжка"
GAME_MSG_LABEL_START_GAME_MOBILE="Зажми тап для прыжка"

GAME_MSG_LABEL_RESTART_GAME="Ткни для новой игры"

local locales = {}

GAME_MSG_LABEL_START_GAME = "game.msg.label.start.game"
GAME_MSG_LABEL_POWERUP_1 = "game.msg.label.powerup.1"
GAME_MSG_LABEL_RESTART_GAME_TITLE = "game.msg.label.restart.game.title"
GAME_MSG_LABEL_COMPLETE_LEVEL_RIBBON_TEXT = "game.msg.label.complete.level.ribbon.text"
GAME_MSG_LABEL_FREE = "game.msg.label.free"
GAME_MSG_POWERUP_GRANTED = "game.msg.powerup.granted"
GAME_MSG_LABEL_TUTORIAL_WASH_ME = "game.msg.label.tutorial.wash.me"

GAME_MSG_LABEL_IMPROVEMENTS_LASER_POWER = "game.msg.label.improvements.laser.power"
GAME_MSG_LABEL_IMPROVEMENTS_LASER_CAPACITY = "game.msg.label.improvements.laser.capacity"
GAME_MSG_LABEL_IMPROVEMENTS_EARNING = "game.msg.label.improvements.earning"

GAME_MSG_LABEL_NOTIFICATION_AD_IN = "game.msg.label.notification.ad.in"
GAME_MSG_LABEL_NOTIFICATION_POWERUP_UNLOCKED = "game.msg.label.notification.powerup.unlocked"

GAME_MSG_BUTTON_CONTINUE = "game.msg.button.continue"


--''

locales.ru = {
    [GAME_MSG_LABEL_START_GAME] = "Зажми для выстрела",
    [GAME_MSG_LABEL_POWERUP_1] = "Струя X2",
    [GAME_MSG_LABEL_RESTART_GAME_TITLE] = "Улучшения",
    [GAME_MSG_LABEL_FREE] = "Бесплатно!",
    [GAME_MSG_POWERUP_GRANTED] = "Улучшение получено: + ",
    [GAME_MSG_LABEL_IMPROVEMENTS_LASER_POWER] = "Струя",
    [GAME_MSG_LABEL_IMPROVEMENTS_LASER_CAPACITY] = "Запас воды",
    [GAME_MSG_LABEL_IMPROVEMENTS_EARNING] = "Заработок",
    [GAME_MSG_LABEL_NOTIFICATION_AD_IN] = "Реклама через .. ",
    [GAME_MSG_BUTTON_CONTINUE] = "Играем дальше",
    [GAME_MSG_LABEL_NOTIFICATION_POWERUP_UNLOCKED] = "Супер Способность Разблокирована: ",
    [GAME_MSG_LABEL_TUTORIAL_WASH_ME] = "Смой Меня",
    [GAME_MSG_LABEL_COMPLETE_LEVEL_RIBBON_TEXT] = "Победа!"

}

locales.en = {
    [GAME_MSG_LABEL_START_GAME] = "Tap and hold for fire",
    [GAME_MSG_LABEL_POWERUP_1] = "Wash Power X2",
    [GAME_MSG_LABEL_RESTART_GAME_TITLE] = "Upgrades!",
    [GAME_MSG_LABEL_FREE] = "Free!",
    [GAME_MSG_POWERUP_GRANTED] = "Powerup Granted: + ",
    [GAME_MSG_LABEL_IMPROVEMENTS_LASER_POWER] = "Wash Power",
    [GAME_MSG_LABEL_IMPROVEMENTS_LASER_CAPACITY] = "Capacity",
    [GAME_MSG_LABEL_IMPROVEMENTS_EARNING] = "Earning",
    [GAME_MSG_LABEL_NOTIFICATION_AD_IN] = "Ad In .. ",
    [GAME_MSG_BUTTON_CONTINUE] = "Continue",
    [GAME_MSG_LABEL_NOTIFICATION_POWERUP_UNLOCKED] = "Super Powerup Unlocked: ",
    [GAME_MSG_LABEL_TUTORIAL_WASH_ME] = "Wash This Out",
    [GAME_MSG_LABEL_COMPLETE_LEVEL_RIBBON_TEXT] = "Victory!"
}

locales.tr = {
    [GAME_MSG_LABEL_START_GAME] = "Ates etmek iсin\nbas1l1 tutun",
    [GAME_MSG_LABEL_POWERUP_1] = "Jet X2",
    [GAME_MSG_LABEL_RESTART_GAME_TITLE] = "Iyilestirmeler",
    [GAME_MSG_LABEL_FREE] = "Ucretsiz!",
    [GAME_MSG_POWERUP_GRANTED] = "Kullan1c1 ad1: + ",
    [GAME_MSG_LABEL_IMPROVEMENTS_LASER_POWER] = "Jet",
    [GAME_MSG_LABEL_IMPROVEMENTS_LASER_CAPACITY] = "Su tedarik etmek",
    [GAME_MSG_LABEL_IMPROVEMENTS_EARNING] = "Kazanc",
    [GAME_MSG_LABEL_NOTIFICATION_AD_IN] = "$ununla reklam ver: .. ",
    [GAME_MSG_BUTTON_CONTINUE] = "Oynamak",
    [GAME_MSG_LABEL_NOTIFICATION_POWERUP_UNLOCKED] = "Super Yetenegin Kilidi Ac1ld1: ",
    [GAME_MSG_LABEL_TUTORIAL_WASH_ME] = "Beni Y1ka",
    [GAME_MSG_LABEL_COMPLETE_LEVEL_RIBBON_TEXT] = "Zafer!"
}

locales.message = function (locale, message_id)
    local locale_effective = locale

    if not locales[locale] then
        locale_effective = 'en'
    end
    if locales[locale_effective][message_id] then
        return locales[locale_effective][message_id]
    else
        return '???'
    end

end

return locales
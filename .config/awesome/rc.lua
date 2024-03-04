pcall(require, "luarocks.loader")

local beautiful = require("beautiful")
local naughty = require("naughty")

naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification({
        urgency = "critical",
        title = "Oops, an error happened"
            .. (startup and " during startup!" or "!"),
        message = message,
    })
end)

-- beautiful.init("~/.config/awesome/themes/gtk/theme.lua")

terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"

-- {{{ Imports
require("config.autostart")
require("config.rules")
require("config.keybinds")
require("config.notification")

require("ui.menu")
require("ui.layout")
require("ui.taskbar")
require("ui.titlebar")
require("ui.wallpaper")
-- }}}

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate({ context = "mouse_enter", raise = false })
end)

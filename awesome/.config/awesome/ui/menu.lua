local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

MY_AWESOME_MENU = {
    {
        "hotkeys",
        function()
            hotkeys_popup.show_help(nil, awful.screen.focused())
        end,
    },
    { "manual", terminal .. " -e man awesome" },
    { "edit config", editor_cmd .. " " .. awesome.conffile },
    { "restart", awesome.restart },
    {
        "quit",
        function()
            awesome.quit()
        end,
    },
}

MY_MAIN_MENU = awful.menu({
    items = {
        { "awesome", MY_AWESOME_MENU, beautiful.awesome_icon },
        { "open terminal", terminal },
    },
})

menubar.utils.terminal = terminal

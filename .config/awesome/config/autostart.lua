local autostart = require("awful").spawn.with_shell

-- Auto Align Monitors
autostart("~/dotfiles/scripts/monitor.sh")

-- Network manager
autostart("nm-applet")

-- Bluetooth Manager
autostart("blueman-applet")

-- {{{ Display Power Management
autostart("xset s off -dpms")
-- }}}

-- {{{ Enable touch press in touchpad
autostart("xinput set-prop 10 288 1")
-- }}}

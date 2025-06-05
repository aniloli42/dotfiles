local autostart = require("awful").spawn.with_shell

-- Auto Align Monitors
autostart("~/dotfiles/scripts/monitor.sh")

-- Network manager
autostart("nm-applet")

-- Picom
-- autostart("picom")

-- Bluetooth Manager
autostart("blueman-applet")

-- {{{ Display Power Management
autostart("xset s off -dpms")
-- }}}

-- {{{ Enable touch press in touchpad
autostart("~/dotfiles/scripts/touchpad_tapping_enable.sh")
-- }}}

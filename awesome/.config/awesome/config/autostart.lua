local autostart = require("awful").spawn.with_shell

autostart('picom')
autostart('dmenu_run')
autostart('nitrogen --restore')
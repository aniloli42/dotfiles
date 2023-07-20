local autostart = require("awful").spawn.with_shell

autostart('picom')
autostart('nitrogen --restore')
autostart('~/.local/bin/monitor_script.sh')

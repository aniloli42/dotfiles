#!/bin/bash

killall -q polybar

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload mybar -c ~/.config/polybar/config.ini &
done

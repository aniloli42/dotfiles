#!/bin/bash

connected_monitors=$(xrandr | grep -E ' connected' | awk '{print $1}')
laptop_monitor=eDP-1
external_monitor=HDMI-1

if [[ "$connected_monitors" == *"$external_montior"* ]]; then
  xrandr \
    --output $laptop_monitor \
    --mode 1920x1080 \
    --rate 60 \
    --primary \
    --output $external_monitor \
    --mode 1920x1080 \
    --rate 75 \
    --left-of $laptop_monitor
else
    xrandr \
      --output $laptop_monitor \
      --mode 1920x1080 \
      --rate 60 \
      --primary \
      --output $external_monitor \
      --off
fi

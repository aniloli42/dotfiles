#!/bin/bash

connected_monitors=$(xrandr | grep -E ' connected' | awk '{print $1}')

if [[ "$connected_monitors" == *"HDMI-A-0"* ]]; then
  xrandr \
    --output eDP \
    --mode 1920x1080 \
    --rate 60 \
    --primary \
    --output HDMI-A-0 \
    --mode 1920x1080 \
    --rate 75 \
    --left-of eDP
else
    xrandr \
      --output eDP \
      --mode 1920x1080 \
      --rate 60 \
      --primary \
      --output HDMI-A-0 \
      --off
fi

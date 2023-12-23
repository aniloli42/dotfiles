#!/bin/bash

connected_monitors=$(xrandr | grep -E ' connected' | awk '{print $1}')


if [[ "$connected_monitors" == *"HDMI-1"* ]]; then
  xrandr \
    --output eDP-1 \
    --mode 1920x1080 \
    --rate 60 \
    --primary \
    --output HDMI-1 \
    --mode 1920x1080 \
    --rate 75 \
    --left-of eDP-1
else
    xrandr \
      --output eDP-1 \
      --mode 1920x1080 \
      --rate 60 \
      --primary \
      --output HDMI-1 \
      --off
fi

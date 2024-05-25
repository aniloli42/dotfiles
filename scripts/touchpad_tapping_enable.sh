#!/bin/bash

# get the touchpad id
id=$(xinput list | grep 'Elan Touchpad' | awk '{print $5}' | cut -d'=' -f2)

# get the tap enable id for touchpad
tap_id=$(xinput list-props $id | grep 'Tapping Enabled (' | awk -F'[()]' '{print $2}')

# enable the tap
xinput set-prop $id $tap_id 1

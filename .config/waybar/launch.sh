#!/usr/bin/env bash

# Terminate already running bar instances
killall -q waybar

# Wait until the processes have been shut down
while pgrep -x waybar >/dev/null; do sleep 0.2; done

# Launch Waybar
waybar &

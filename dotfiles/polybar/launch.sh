#!/bin/bash

set -x

DIR="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

for i in /sys/class/hwmon/hwmon*/temp*_input; do 
    if [ "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*}))" = "coretemp: Core 0" ]; then
        export HWMON_PATH="$i"
    fi
done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d " " -f1); do
    MONITOR=$m polybar -r -q main -c "$DIR"/config.ini &
  done
fi

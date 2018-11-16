#!/usr/bin/env sh

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do pkill polybar; done

polybar top -r& 2> /dev/null
polybar bottom -r& 2> /dev/null


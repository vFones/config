#!/usr/bin/env sh

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do pkill polybar; done

polybar -c ~/.config/polybar/usefull top &
polybar -c ~/.config/polybar/custom subtop &


if  polybar -m | grep HDMI1

then

	killall -q polybar
        polybar -c ~/.config/polybar/usefull topHDMI &
        polybar -c ~/.config/polybar/custom subtopHDMI &
fi

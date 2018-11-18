#!/bin/bash

status=`xrandr --prop | grep HDMI-1 | awk '{ print $2 }'`

if [ $status == "connected" ]; then
  xrandr --auto &2>/dev/null
  xrandr --output "HDMI-1" --primary --right-of "LVDS-1" &2>/dev/null
else
  xrandr --auto &2>/dev/null
fi


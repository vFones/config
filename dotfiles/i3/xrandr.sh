#!/bin/bash
set -x
status=`xrandr --prop | grep HDMI-1 | awk '{ print $2 }'`

is_high_rate=`xrandr --prop | grep 144.00 |  awk '{ print $3 }'`
RATE=60
if [ $is_high_rate == "144.00" ]; then
  RATE=144
fi
 
if [ $status == "connected" ]; then
  xrandr --output eDP-1 --mode 1920x1080 --pos 2087x108 --rotate normal --output HDMI-1 --rate $RATE --primary --mode 1920x1080 --pos 167x108 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off
else
  xrandr --auto &2>/dev/null
fi


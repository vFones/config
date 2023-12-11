#!/bin/bash

POS="--right-of"
if [[ $1 == "left" ]]; then
  POS="--left-of"
elif [[ $1 == "up" ]]; then
  POS="--below"
fi

status=`xrandr --prop | grep HDMI-1 | awk '{ print $2 }'`

if [[ $status == "connected" ]]; then
  if [[ $1 == "disabled" ]]; then
    xrandr --output eDP-1 --off --output HDMI-1 --auto
  else
    xrandr --output eDP-1 --mode 1920x1080 --rotate normal $POS HDMI-1 --output HDMI-1 --auto
  fi
else
  xrandr --auto &2>/dev/null
fi

$HOME/.config/polybar/launch.sh

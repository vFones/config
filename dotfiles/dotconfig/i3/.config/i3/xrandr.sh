#!/bin/bash

## change xrandr monitor disposition according to the needs


status=`xrandr --prop | grep HDMI-1 | awk '{ print $2 }'`

if [ $status == "connected" ]; then
  xrandr --auto &2>/dev/null
  xrandr --output LVDS-1 --primary --pos 328x1080 --output HDMI-1 --pos 0x0
else
  xrandr --auto &2>/dev/null
fi


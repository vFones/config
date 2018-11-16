#!/bin/bash

icon=""

temp=$(redshift -p 2>/dev/null| grep temp | awk '{ print $3 }' | cut -c -4)

if [[ $temp -ge 5000 ]]; then
        echo "%{F#458588}$icon"       # Blue
elif [[ $temp -ge 4000 ]]; then
        echo "%{F#d79921}$icon"       # Yellow
else
        echo "%{F#cc241d}$icon"       # Orange
fi

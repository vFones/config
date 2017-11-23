#!/bin/bash

# Specifying the icon(s) in the script
# This allows us to change its appearance conditionally
icon=""

pgrep -x redshift &> /dev/null
if [[ $? -eq 0 ]]; then
        temp=$(redshift -p 2>/dev/null | grep Temp | cut -d' ' -f4)
        temp=${temp//K/}
fi

# OPTIONAL: Append ' ${temp}K' after $icon
if [[ -z $temp ]]; then
        echo "%{F#928374}$icon"       # Greyed out (not running)
elif [[ $temp -ge 5000 ]]; then
        echo "%{F#458588}$icon"       # Blue
elif [[ $temp -ge 4000 ]]; then
        echo "%{F#d79921}$icon"       # Yellow
else
        echo "%{F#cc241d}$icon"       # Orange
fi

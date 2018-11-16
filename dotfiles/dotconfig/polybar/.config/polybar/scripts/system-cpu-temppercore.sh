#!/bin/sh
#source https://github.com/x70b1/polybar-scripts/tree/master/polybar-scripts/system-cpu-temppercore

echo "("`sensors | grep Core \
| awk '{print substr($3, 2, length($3)-5)}' \
| tr "\\n" " " \
| sed 's/ /°C  /g' | sed 's/  $//'`")"

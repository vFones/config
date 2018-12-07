#!/bin/sh
#taken from https://github.com/x70b1/polybar-scripts/tree/master/polybar-scripts/updates-arch-combined

updates=$(yay -Quy | wc -l)
echo "(# $updates)"

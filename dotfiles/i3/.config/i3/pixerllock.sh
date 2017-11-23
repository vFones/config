#!/bin/sh

xbacklight -set 0%
xwobf /tmp/.i3lock.png

i3lock -i /tmp/.i3lock.png --clock --indicator -f \
	--insidecolor=373445ff --ringcolor=ffffffff --line-uses-inside \
	--keyhlcolor=d23c3dff --bshlcolor=d23c3dff --separatorcolor=00000000 \
	--insidevercolor=fecf4dff --insidewrongcolor=d23c3dff \
	--ringvercolor=00000035 --ringwrongcolor=ffffffff \
	--veriftext="" --wrongtext=""

#i3lock -i /tmp/.i3lock.png --clock --indicator -f --textcolor=ffffff00 --insidecolor=ffffff3e --ringcolor=ffffff3e --linecolor=ffffff00 --keyhlcolor=00000080 --ringvercolor=00000000 --separatorcolor=22222260 --insidevercolor=0000001c --ringwrongcolor=00000055 --insidewrongcolor=0000001c
rm /tmp/.i3lock.png
xbacklight -set 50%

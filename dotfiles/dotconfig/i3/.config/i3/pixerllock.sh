#!/bin/bash

letterEnteredColor=d23c3dff
letterRemovedColor=d23c3dff
passwordCorrect=00000000
passwordIncorrect=d23c3dff
background=00000000
foreground=ffffffff
rectangles="rectangle 24,734 324,660"

#xbacklight -set 0%
xwobf /tmp/.i3lock.png
TMPBG=/tmp/.i3lock.png

convert $TMPBG -draw "fill black fill-opacity 0.4 $rectangles" $TMPBG

i3lock	-i /tmp/.i3lock.png \
	--timepos="x-90:h-ch+30" \
	--datepos="tx+24:ty+25" \
	--clock --datestr "Type password to unlock..." \
	--insidecolor=$background --ringcolor=$foreground --line-uses-inside \
	--keyhlcolor=$letterEnteredColor --bshlcolor=$letterRemovedColor --separatorcolor=$background \
	--insidevercolor=$passwordCorrect --insidewrongcolor=$passwordIncorrect \
	--ringvercolor=$foreground --ringwrongcolor=$foreground --indpos="x+280:h-70" \
	--radius=20 --ring-width=4 --veriftext="" --wrongtext="" \
	--textcolor="$foreground" --timecolor="$foreground" --datecolor="$foreground"

rm /tmp/.i3lock.png
#xbacklight -set 50%

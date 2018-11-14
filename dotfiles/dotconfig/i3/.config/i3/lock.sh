#!/bin/bash

letterEnteredColor=d23c3dff
letterRemovedColor=d23c3dff
passwordCorrect=00000000
passwordIncorrect=d23c3dff
background=00000000
foreground=ffffffff
rectangles="rectangle 24,734 324,660"

#xbacklight -set 0%
TMPBG=/tmp/.i3lock.png

convert $TMPBG -draw "fill black fill-opacity 0.4 $rectangles" $TMPBG

i3lock	-i /tmp/.i3lock.png -e -k \
    --timepos="x+120:h-70" --timecolor=$foreground \
    --datepos="tx+0:ty+20" --noinputtext="" \
    --insidecolor=$background --ringcolor=$foreground --line-uses-inside \
		--keyhlcolor=$letterEnteredColor --bshlcolor=$letterRemovedColor --separatorcolor=$background \
		--insidevercolor=$passwordCorrect --insidewrongcolor=$passwordIncorrect \
		--ringvercolor=$foreground --ringwrongcolor=$foreground --indpos="x+280:h-70" \
		--radius=20 --ring-width=4 --veriftext="" --wrongtext="" \
		--layoutcolor="$foreground" --datecolor="$foreground" 

rm /tmp/.i3lock.png
#xbacklight -set 50%

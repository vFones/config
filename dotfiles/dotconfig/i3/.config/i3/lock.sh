#!/bin/bash

letterEnteredColor=d23c3dff
letterRemovedColor=d23c3dff
passwordCorrect=00000000
passwordIncorrect=d23c3dff
background=00000000
foreground=ffffffff

nresX="1280"
nresY="720"
resX=$(xdpyinfo | grep dimensions | awk '{print $2}' | sed -r 's/([0-9])x.*$/\1/')
resY=$(xdpyinfo | grep dimensions | awk '{print $2}' | sed -r 's/^[0-9]*x([0-9]+)/\1/')

if [ "${resX}x${resY}" == "${nresX}x${nresY}" ]; then
  timepos='x+640:h-360'
  indpos='x+740:h-360'
else
  $resX=`expr $resX - $nresX`
  timepos="x+`expr $resX/2`:h-`expr $resY/2`"
  indpos="x+`expr $resX/2+100`:h-`expr $resY/2`"
fi

#xbacklight -set 0%
TMPBG=/tmp/.i3lock.png
killall -SIGUSR1 dunst # pause
convert $TMPBG -fill black -colorize 40% $TMPBG
i3lock -n -i /tmp/.i3lock.png -e -k \
    --timecolor=$foreground \
    --timepos=$timepos --indpos=$indpos \
    --noinputtext="" --insidecolor=$background \
    --ringcolor=$foreground --line-uses-inside --keyhlcolor=$letterEnteredColor \
    --bshlcolor=$letterRemovedColor --separatorcolor=$background \
		--insidevercolor=$passwordCorrect --insidewrongcolor=$passwordIncorrect \
		--ringvercolor=$foreground --ringwrongcolor=$foreground \
		--radius=20 --ring-width=4 --veriftext="" --wrongtext="" \
		--layoutcolor="$foreground" --datecolor="$foreground" 
killall -SIGUSR2 dunst # resume
rm /tmp/.i3lock.png
#xbacklight -set 50

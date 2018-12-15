#!/bin/bash

lock(){
  i3lock -n -e -k -t -i $1 \
    --screen=1 \
    --timecolor=$foreground \
    --noinputtext="" --insidecolor=$background \
    --ringcolor=$foreground --line-uses-inside \
    --keyhlcolor=$letterEnteredColor \
    --bshlcolor=$letterRemovedColor \
    --separatorcolor=$background \
    --insidevercolor=$passwordCorrect \
    --insidewrongcolor=$passwordIncorrect \
    --ringvercolor=$foreground --ringwrongcolor=$foreground \
    --radius=20 --ring-width=4 --veriftext="" --wrongtext="" \
    --layoutcolor="$foreground" --datecolor="$foreground" \
    --indpos=$indpos --timepos=$timepos 
}

letterEnteredColor=d23c3dff
letterRemovedColor=d23c3dff
passwordCorrect=00000000
passwordIncorrect=d23c3dff
background=00000000
foreground=ffffffff

nresX="1280"
nresY="800"
resX=$(xdpyinfo | grep dimensions | awk '{print $2}' |\
  sed -r 's/([0-9])x.*$/\1/')
resY=$(xdpyinfo | grep dimensions | awk '{print $2}' |\
  sed -r 's/^[0-9]*x([0-9]+)/\1/')

timepos="x+640:h-360"
indpos="x+740:h-360"

if [ "${resX}x${resY}" == "${nresX}x${nresY}" ]; then
  wall=$HOME/Nextcloud/Immagini/Wallpaper/i3.jpg
else
  wall=$HOME/Nextcloud/Immagini/Wallpaper/space.png
fi

killall -SIGUSR1 dunst # pause
lock $wall
killall -SIGUSR2 dunst # resume

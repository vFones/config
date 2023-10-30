#!/bin/bash

lock(){
  i3lock -n -e -k -t -i $1 \
    --screen=1 \
    --time-color=$background \
    --noinput-text="" --inside-color=$background \
    --ring-color=$foreground --line-uses-inside \
    --keyhl-color=$letterEnteredColor \
    --bshl-color=$letterRemovedColor \
    --separator-color=$background \
    --insidever-color=$passwordCorrect \
    --insidewrong-color=$passwordIncorrect \
    --ringver-color=$foreground --ringwrong-color=$foreground \
    --radius=20 --ring-width=4 --verif-text="" --wrong-text="" \
    --layout-color=$foreground --date-color=$foreground \
    --ind-pos=$indpos --time-pos=$timepos --time-size=80 
}

letterEnteredColor=d23c3dff
letterRemovedColor=d23c3dff
passwordCorrect=00000000
passwordIncorrect=d23c3dff
background=ff8700
foreground=ffffffff

#nresX="1920"
#nresY="1280"
#resX=$(xdpyinfo | grep dimensions | awk '{print $2}' |\
#  sed -r 's/([0-9])x.*$/\1/')
#resY=$(xdpyinfo | grep dimensions | awk '{print $2}' |\
#  sed -r 's/^[0-9]*x([0-9]+)/\1/')

timepos="x+640:h-360"
indpos="x+840:h-390"

PICTURE=/tmp/i3lock.png
SCREENSHOT=$(scrot -z $PICTURE)

BLUR="20x16"

$SCREENSHOT
convert $PICTURE -modulate 60 -blur $BLUR $PICTURE


#if [ "${resX}x${resY}" == "${nresX}x${nresY}" ]; then
#  wall=$HOME/Nextcloud/Pictures/Wallpaper/i3.jpg
#else
#  wall=$HOME/Nextcloud/Pictures/Wallpaper/space.png
#fi

killall -SIGUSR1 dunst # pause
amixer -q sset Master,0 toggle
xset s off dpms 0 10 0
lock $PICTURE
xset s off -dpms
rm $PICTURE
killall -SIGUSR2 dunst # resume

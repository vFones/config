#!/bin/bash
lock(){
  i3lock -n -e -k $1 $2 \
    --timecolor=$foreground \
    --timepos=$timepos --indpos=$indpos \
    --noinputtext="" --insidecolor=$background \
    --ringcolor=$foreground --line-uses-inside --keyhlcolor=$letterEnteredColor \
    --bshlcolor=$letterRemovedColor --separatorcolor=$background \
		--insidevercolor=$passwordCorrect --insidewrongcolor=$passwordIncorrect \
		--ringvercolor=$foreground --ringwrongcolor=$foreground \
		--radius=20 --ring-width=4 --veriftext="" --wrongtext="" \
		--layoutcolor="$foreground" --datecolor="$foreground"
}

letterEnteredColor=d23c3dff
letterRemovedColor=d23c3dff
passwordCorrect=00000000
passwordIncorrect=d23c3dff
background=00000000
foreground=ffffffff

tmp=/tmp/lock.png

nresX="1280"
nresY="800"
resX=$(xdpyinfo | grep dimensions | awk '{print $2}' | sed -r 's/([0-9])x.*$/\1/')
resY=$(xdpyinfo | grep dimensions | awk '{print $2}' | sed -r 's/^[0-9]*x([0-9]+)/\1/')

if [ "${resX}x${resY}" == "${nresX}x${nresY}" ]; then
  timepos="x+640:h-360"
  indpos="x+740:h-360"
  wall=native.jpg
  cp $wall -f $tmp
  convert $tmp -fill black -colorize 40% $tmp
  arg0="-i"
  arg1="$tmp"
else
  resX=`expr $resX - $nresX`
  timepos="x+`expr $resX/2`:h-`expr $resY/2`"
  indpos="x+`expr $resX/2+100`:h-`expr $resY/2`"
  arg0="--blur=10"
fi

killall -SIGUSR1 dunst # pause
lock $arg0 $arg1
killall -SIGUSR2 dunst # resume
rm $tmp 2> /dev/null 

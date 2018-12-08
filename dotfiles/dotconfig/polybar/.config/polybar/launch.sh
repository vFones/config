#!/usr/bin/env sh

poly(){
  polybar $1 -r &2> /dev/null
}

# Wait until the processes have been shut down
while pgrep -x polybar &>/dev/null; do pkill polybar; done

bars="top
bottom
tophdmi
bothdmi"

if [ `polybar -m | wc -l` -gt 1 ]; then
  for bar in $bars
  do
    poly "$bar"
  done
else
  poly "top"
  poly "bottom"
fi


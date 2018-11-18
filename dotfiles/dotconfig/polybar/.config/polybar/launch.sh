#!/usr/bin/env sh

# Wait until the processes have been shut down
while pgrep -x polybar &>/dev/null; do pkill polybar; done

if [ `polybar -m | wc -l` -gt 1 ]; then
  top="tophdmi"
  bottom="bothdmi"
else
  top="top"
  bottom="bottom"
fi
polybar $top -r &2> /dev/null
polybar $bottom -r &2> /dev/null

#! /bin/bash

u=$(xprop -name "Polybar tray window" _NET_WM_PID | grep -o '[[:digit:]]*')
if [[ -n $u ]]; then
  kill $u >> /tmp/polybar2.log
else
  polybar tray --config=~/.config/polybar/config.ini >> /tmp/polybar2.log 2>&1
fi


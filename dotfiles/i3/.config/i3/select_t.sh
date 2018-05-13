#!/usr/bin/env bash
read -r X Y W H G ID < <(slop -f "%x %y %w %h %g %i" -b 1 -t 0 -q)

let "W = W / 8"
let "H = H / 16"
g=${W}x${H}+${X}+${Y}
i3-msg exec 'xfce4-terminal --geometry '$g''

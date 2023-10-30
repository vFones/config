#!/bin/bash

rofi -modi run,drun -lines 12 -padding 18 \
  -width 60 -location 0 -show drun \
  -sidebar-mode -columns 3 -font "Fira Code Nerd Font 11" \
  -theme $HOME/.config/polybar/scripts/rofi/styles.rasi


#!/bin/bash

rofi -modi run,drun,window -config ~/.config/rofi/config \
  -lines 12 -padding 18 -width 60 -location 0 -show drun \
  -sidebar-mode -columns 3 -font "Hack Nerd Font 11"

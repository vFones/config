#!/bin/sh

notify-send "Battery" "` acpi | cut -b 11- `" 
notify-send "Volume `amixer get Master | grep '%' | grep -oE '[^ ]+$'`" \
  "`amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1`%"
notify-send "Bklight" "Screen: `light`% - keeb: `kbdlight get`%"

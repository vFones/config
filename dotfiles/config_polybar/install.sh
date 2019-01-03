#!/usr/bin/env bash

if [ -e $HOME/.config/polybar ]; then
  if [ -L $HOME/.config/polybar ]; then
    ln -s -f $(pwd) $HOME/.config/polybar
    exit 1
  fi
  echo "Linking every file in polybar to .config/polybar"
  for x in $(ls);
  do
    ln -s $(pwd)/$x $HOME/.config/polybar/$x
  done
else
  echo "Linking polybar folder to .config/polybar"
  ln -s $(pwd) $HOME/.config/polybar
fi

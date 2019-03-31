#!/bin/bash

if [ -e $HOME/.config/polybar ]; then
  if [ -L $HOME/.config/polybar ]; then
    ln -s -f $PWD/dotfiles/config_polybar $HOME/.config/polybar
    exit 1
  fi
  echo "Linking every file in polybar to .config/polybar"
  for x in $(ls);
  do
    ln -s -f $PWD/dotfiles/config_polybar/$x $HOME/.config/polybar/$x
  done
else
  echo "Linking polybar folder to .config/polybar"
  ln -s -f $PWD/dotfiles/config_polybar $HOME/.config/polybar
fi

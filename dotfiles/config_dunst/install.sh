#!/bin/bash

if [ -e $HOME/.config/dunst ]; then
  echo "Linking dunstrc to .config/dunst/dunstrc"
  ln -s -f $PWD/dotfiles/config_dunst/dunstrc $HOME/.config/dunst/dunstrc
else
  ln -s -f $PWD/dotfiles/config_dunst $HOME/.config/dunst
  echo "Linking dunst folder to .config/dunst"
fi

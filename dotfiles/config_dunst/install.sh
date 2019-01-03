#!/usr/bin/env bash

if [ -e $HOME/.config/dunst ]; then
  echo "Linking dunstrc to .config/dunst/dunstrc"
  ln -s -f $(pwd)/dunstrc $HOME/.config/dunst/dunstrc
else
  ln -s $(pwd) $HOME/.config/dunst
  echo "Linking dunst folder to .config/dunst"
fi

#!/usr/bin/env bash

echo "Linking termite to .config/termite"
if [ -e $HOME/.config/termite ]; then
  if [ -L $HOME/.config/termite ]; then
    ln -s -f $(pwd) $HOME/.config/termite
    exit 1
  fi
  ln -s $(pwd)/config $HOME/.config/termite/config
else
  mkdir -p $HOME/.config/termite
  ln -s $(pwd)/config $HOME/.config/termite/config
fi

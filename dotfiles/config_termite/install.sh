#!/bin/bash
echo "Linking termite to .config/termite"
if [ -e $HOME/.config/termite ]; then
  if [ -L $HOME/.config/termite ]; then
    ln -s -f $PWD/dotfiles/config_termite/ $HOME/.config/termite
    exit 1
  fi
  ln -s -f $PWD/dotfiles/config_termite/config $HOME/.config/termite/config
else
  ln -s -f $PWD/dotfiles/config_termite $HOME/.config/termite
fi

#!/usr/bin/env bash
if ! test "$(uname)" = "Darwin"; then
  if [ -e $HOME/.config/polybar ]; then
    if [ -L $HOME/.config/polybar ]; then
      ln -s -f $1/config_polybar $HOME/.config/polybar
      exit 1
    fi
    echo "Linking every file in polybar to .config/polybar"
    for x in $(ls);
    do
      ln -s -f $1/config_polybar/$x $HOME/.config/polybar/$x
    done
  else
    echo "Linking polybar folder to .config/polybar"
    ln -s -f $1/config_polybar $HOME/.config/polybar
  fi
fi

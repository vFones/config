#!/usr/bin/env bash
if ! test "$(uname)" = "Darwin"; then
  if [ -e $HOME/.config/i3 ]; then
    if [ -L $HOME/.config/i3 ]; then
      ln -s -f $(pwd) $HOME/.config/i3
      exit 1
    fi
    echo "Linking every file in i3 to .config/i3"
    for x in $(ls);
    do
      ln -s $(pwd)/$x $HOME/.config/i3/$x
    done
  else
    echo "Linking i3 folder to .config/i3"
    ln -s $(pwd) $HOME/.config/i3
  fi
fi

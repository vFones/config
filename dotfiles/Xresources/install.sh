#!/usr/bin/env bash
if ! test "$(uname)" = "Darwin"; then
  echo "Linking Xresources to home..."
  ln -s -f $1/Xresources/Xresources.link $HOME/.Xresources
  xrdb  xrdb $HOME/.Xresources
fi

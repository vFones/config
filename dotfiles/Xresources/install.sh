#!/usr/bin/env bash
if ! test "$(uname)" = "Darwin"; then
  echo "Linking Xresources to home..."
  ln -s -f $(pwd)/Xresources.link $HOME/.Xresources
  xrdb  xrdb ~/.Xresources
fi

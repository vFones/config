#!/usr/bin/env bash

if ! test "$(uname)" = "Darwin"; then
  echo "Linking compton to home"
  ln -s -f $(pwd)/compton.link $HOME/.compton.conf
fi

#!/usr/bin/env bash

if ! test "$(uname)" = "Darwin"; then
  echo "Linking compton to home"
  ln -s -f $1/compton.conf/compton.link $HOME/.compton.conf
fi

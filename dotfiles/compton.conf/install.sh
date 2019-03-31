#!/bin/bash

#if ! test "$(uname)" = "Darwin"; then
  echo "Linking compton to home"
  ln -s -f $PWD/dotfiles/compton.conf/compton.link $HOME/.compton.conf
#fi

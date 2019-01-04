#!/usr/bin/env bash

echo "Linking vim to home..."
ln -s -f $1/vimrc/vimrc.link $HOME/.vimrc

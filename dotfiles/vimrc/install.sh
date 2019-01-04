#!/usr/bin/env bash

echo "Linking vim to home..."
ln -s -f $1/vimrc.link $HOME/.vimrc

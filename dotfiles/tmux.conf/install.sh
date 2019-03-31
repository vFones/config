#!/bin/bash

echo "Linking tmux to home..."
ln -s -f -v $PWD/dotfiles/tmux.conf/tmux.link $HOME/.tmux.conf

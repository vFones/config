#!/usr/bin/env bash

echo "Linking tmux to home..."
ln -s -f $1/tmux.conf/tmux.link $HOME/.tmux.conf

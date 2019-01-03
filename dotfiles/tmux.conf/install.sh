#!/usr/bin/env bash

echo "Linking tmux to home..."
ln -s -f $(pwd)/tmux.link $HOME/.tmux.conf

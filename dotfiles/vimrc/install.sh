#!/usr/bin/env bash

echo "Linking vim to home..."
ln -s -f $(pwd)/vimrc.link $HOME/.vimrc
vim +'PlugInstall --sync' +qa
vim +'PlugUpdate' +qa

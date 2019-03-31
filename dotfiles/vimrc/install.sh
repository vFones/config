#!/bin/bash

echo "Linking vim to home..."
ln -s -f -v $PWD/dotfiles/vimrc/vimrc.link $HOME/.vimrc

vim +'PlugInstall --sync' +qa
vim +'PlugUpdate' +qa

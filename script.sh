#!/bin/sh

VUNDLEGIT="https://github.com/VundleVim/Vundle.vim.git"

mv $HOME/.vim{,bk} && mv $HOME/.vimrc{,bk}

mv dotfiles/.vim* $HOME/

git clone $VUNDLEGIT $HOME/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

#!/bin/sh

VUNDLEGIT="https://github.com/VundleVim/Vundle.vim.git"
OHMYZSHGIT="https://github.com/robbyrussell/oh-my-zsh"

BACKUPFOLDER=($PWD/backup)
DOTCONFIG=($PWD/dotfiles/dotconfig)
DOTHOME=($PWD/dotfiles/dothome)

mkdir $BACKUPFOLDER
git clone $OHMYZSHGIT $DOTHOME/oh-my-zsh/.oh-my-zsh/


#Backing up file in .config folder
cd $DOTCONFIG
for dotfile in $(ls);
do
    tmp="$HOME/.config/$dotfile"
    if [ -e "$tmp" ]; then
        mv $tmp $BACKUPFOLDER
    fi
done
#Creating symlink
for dotfile in $(ls)
do
   stow -v -t $HOME -R $dotfile
done

#Backing up dotfiles in home
cd $DOTHOME
for dotfile in $(ls);
do
    tmp="$HOME/.$dotfile"
    if [ -e "$tmp" ]; then
        mv $tmp $BACKUPFOLDER
    fi
done
#Creating symlink
for dotfile in $(ls)
do
   stow -v -t $HOME -R $dotfile
done

git clone $VUNDLEGIT $HOME/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

#!/bin/sh

#install zsh, gawk, fzy, vim AT LEAST

lnstuff(){
  for dotfile in $(ls)
  do
    stow -v -t $HOME -R $dotfile
  done
}

backuper(){
  cd $1
  for dotfile in $(ls);
  do
    tmp="$HOME/.config/$dotfile"
    if [ -e "$tmp" ]; then
        mv $tmp $BACKUPFOLDER
    fi
  done
}

BACKUPFOLDER=$PWD/backup
DOTCONFIG=$PWD/dotfiles/dotconfig
DOTHOME=$PWD/dotfiles/dothome

if [ -d -e $BACKUPFOLDER ]; then
  mkdir $BACKUPFOLDER
fi

if test "$(uname)" = "Darwin"; then
  if test ! $(which gcc); then
    echo "Installing xcode..."
    xcode-select --install
  fi
  if test ! "$(which brew)"; then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    brew update
  fi
fi

backuper $DOTCONFIG
lnstuff
backuper $DOTHOME
lnstuff

brew install coreutil zplug fzy getantibody/tap/antibody
pip install powerline-shell

vim +'PlugInstall --sync' +qa
vim +'PlugUpdate' +qa

#!/bin/bash

BACKUPFOLDER=$(mkdir -pv "$PWD/backup/$(date +%F__%H:%M:%S)" | awk '{print $4}' | tr -d "'")
MNMLCONF="tmux.conf vimrc zshrc"
FULLCONF=$(ls dotfiles)
MNMLDEP="antibody fzy vim tmux diff-so-fancy ranger zsh neofetch"
FULLDEP=('compton' 'dunst' 'i3-gaps' 'polybar' 'termite' 'xresources' 'redshift' 'xidlehook'
'i3lock-color-git' 'feh' 'hsetroot' 'rofi')


__minimum_requirements(){
  if test "$(uname)" = "Darwin"; then
    echo "****************************************"
    echo "*************** MAC OSX ****************"
    echo "****************************************"
    if test ! $(which gcc); then
      echo "Installing xcode..."
      xcode-select --install
    fi
    if test "$(which brew)"; then
      brew update
    else
      echo "Installing homebrew..."
      ruby -e "$(curl -fsSL \
        https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    distro=1
  else
    if test "$(uname -r)" | grep "ARCH"; then
      echo "****************************************"
      echo "************* ARCH LINUX ***************"
      echo "****************************************"
      if test $(which yay); then
        yay -Suy
        distro=2
      else
        echo "Using Arch w/o yay? REALLY?!"
      fi
    else
      echo "****************************************"
      echo "*********  Unsupported Distro  *********"
      echo "****************************************"
    fi
  distro=0
  fi
}


backup(){
  echo "Going to backup: $1"
  for dotfile in $1; do
    if [[ $dotfile == config_* ]]; then
      tmp="$HOME/.config/${dotfile#config_*}"
    else
      tmp="$HOME/.$dotfile"
    fi
    if [ -e "$tmp" ]; then
      if [ ! -L "$tmp" ]; then
        mv $tmp $BACKUPFOLDER
      else
        echo "****************************************"
        echo "$dotfile is a symlink, GOING TO OVERRIDE"
        echo "****************************************"
      fi
    fi
  done
}


full(){
  backup "$FULLCONF"
  yay -S $MNMLDEP $FULLDEP
  git ls-tree --name-only -r master | grep install.sh | \
  while read -r installer; do
	  echo "${installer}..."
	  sh -c "$installer"
  done
}


basic(){
  backup "$MNMLCONF"
  if (( $1 == 0 )); then
    brew install $MNMLDEP
  else
    yay -S $MNMLDEP
  fi
  for el in $MNMLCONF; do
    sh -c "dotfiles/$el/install.sh"
  done
}


__minimum_requirements
if (( $distro > 0 )); then
  if (( $distro == 1 )); then
    #macosx installation
    basic 0
  else
    #arch linux stuff
    if (( $full_flag == 1 )); then
      full
    else
      basic 1
    fi
  fi
  echo "Bye bye..."
fi

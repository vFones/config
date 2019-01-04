#!/usr/bin/env bash

DOTS=$PWD/dotfiles/

if test "$(uname)" = "Darwin"; then
  BACKUPFOLDER=$(gmkdir -pv "$PWD/backup/$(date +%F__%H:%M:%S)" | awk '{print $4}' | tr -d "'")
else
  BACKUPFOLDER=$(mkdir -pv "$PWD/backup/$(date +%F__%H:%M:%S)" | awk '{print $4}' | tr -d "'")
fi

backuper(){
  cd $1
  for dotfile in $(ls);
  do
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
        continue
      fi
    else
      continue
    fi
  done
}

dependencies_installer(){
  if test "$(uname)" = "Darwin"; then
    if test ! $(which gcc); then
      echo "Installing xcode..."
      xcode-select --install
    fi
    if test "$(which brew)"; then
      brew update
      brew install coreutils fzy getantibody/tap/antibody vim tmux
    else
      echo "Installing homebrew..."
      ruby -e "$(curl -fsSL \
        https://raw.githubusercontent.com/Homebrew/install/master/install)"
      brew install coreutil fzy getantibody/tap/antibody vim tmux
    fi
  else
    if test "$(uname -r)" | grep "ARCH"; then
      if test $(which yay); then
        yay -Suy
        yay -S fzy zsh antibody i3-gaps compton tmux dunst polybar termite \
          redshift xidlehook i3lock-color-git feh hsetroot rofi
      else
        echo "Using Arch w/o yay? REALLY?!"
      fi
    else
      echo "Good luck in esports w Debian based distro"
    fi
  fi
}
install_all_the_scripts(){
  git ls-tree --name-only -r osx | grep install.sh | while read -r installer; do
	  echo "${installer}..."
	  sh -c "$installer $(pwd)"
  done
}
backuper $DOTS
dependencies_installer
install_all_the_scripts

vim +'PlugInstall --sync' +qa
vim +'PlugUpdate' +qa

#!/bin/bash

echo "Linking zsh stuff to home..."
ln -s -f -v $PWD/dotfiles/zshrc/zshrc.link $HOME/.zshrc
ln -s -f -v $PWD/dotfiles/zshrc/zsh_plugins.link $HOME/.zsh_plugins
antibody bundle < ~/.zsh_plugins > ~/.zsh_plugins.sh

chsh -s $(which zsh)

echo "Reboot/Log out to see changes"

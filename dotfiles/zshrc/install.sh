#!/usr/bin/env bash

echo "Linking zsh stuff to home..."
ln -s -f $(pwd)/zshrc.link $HOME/.zshrc
ln -s -f $(pwd)/zsh_plugins.link $HOME/.zsh_plugins

antibody bundle < ~/.zsh_plugins > ~/.zsh_plugins.sh
echo "set zsh shell: chsh -s $(which zsh)"
echo "Restart terminal or zsh to apply"
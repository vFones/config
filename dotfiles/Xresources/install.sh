#!/usr/bin/env bash

echo "Linking Xresources to home..."
ln -s -f $(pwd)/Xresources.link $HOME/.Xresources
xrdb  xrdb ~/.Xresources

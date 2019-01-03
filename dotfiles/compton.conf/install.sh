#!/usr/bin/env bash

echo "Linking compton to home"
ln -s -f $(pwd)/compton.link $HOME/.compton.conf

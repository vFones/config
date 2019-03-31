#!/bin/bash

if [ -f packages-list.bk ]; then
  apm clean
  apm install --packages-file packages-list.bk
else
  echo "Error: No such file package-list.bk"
fi

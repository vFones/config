#!/bin/sh


if test "$(which apm)"; then
  echo "Going to install iTzAtom x xMentos5091's Atom packages on TOP of yours"

  echo "Backuping your packages."
  apm list --installed --bare > packages-list.bk
  echo "Backup created!"

  if [ -f packages-list ]; then
    apm install --packages-file packages-list
  fi

  echo "If want to restore yours launch restore.sh inside this folder."
else
  echo "Install Atom from: https://atom.io/"
fi

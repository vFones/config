#!/bin/bash

dir="/media/$USER"

if [ $# -ne 0 ]; then
  dir="${1%/}"
fi

for f in `ls $dir`; do
  size=`df --output=avail -h $dir/$f | tail -1`
  size="${size}B"
  res="$res $f ($size)  "
done

echo -e "${res%*  }"

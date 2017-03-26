#!/bin/bash
for i in "$@"
do
  echo "Processing $i"
  exiftool -all= "$i"
done

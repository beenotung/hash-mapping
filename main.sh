#!/bin/bash
set -e
input=$1
while true; do
  output=$(echo "$input" | sha256sum | awk '{print $1}')
  #echo "$input ~~> $output"
  if [ -f $output ]; then
    old=$(cat $output)
    if [ "$old" != "$input" ]; then
      echo "collision found, both hash to $output"
      echo "$old"
      echo "$input"
      exit 0
    else
      echo "skip $output"
    fi
  else
    echo "$input" > "$output"
  fi
  input=$output
done

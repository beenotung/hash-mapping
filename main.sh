#!/bin/bash
set -e
input=$1
while true; do
  output=""
  while [ "$output" == "" ]; do
    ## maybe opening too many files
    output=$(echo "$input" | sha256sum | awk '{print $1}')
  done
  #echo "$input ~~> $output"
  if [ "$output" == "" ]; then
    echo "error: hash is empty"
    exit 1
  fi
  if [ -f $output ]; then
    old=""
    while [ "$old" == "" ] && [ "$output" != "01ba4719c80b6fe911b091a7c05124b64eeece964e09c058ef8f9805daca546b" ]; do
      ## in case opening too many files
      old=$(cat $output)
    done
    if [ "$old" != "$input" ]; then
      echo "collision found, both hash to $output" | tee -a log
      echo "$output <--1: $old" | tee -a log
      echo "$output <--2: $input" | tee -a log
      bash stop-all.sh
      exit 0
    #else
    #  echo "skip $output"
    fi
  else
    echo "$input" > "$output"
  fi
  input=$output
done

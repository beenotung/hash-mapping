#!/bin/bash
function main {
  bash main.sh $RANDOM &
}
if [ $# == 0 ]; then
  main
  exit
fi
acc=$1
while [ $acc != 0 ]; do
  main
  acc=$(($acc-1))
done

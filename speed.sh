#!/bin/bash
l=$(ls | wc -l)
while true; do
  c=$(ls | wc -l)
  diff=$(($c-$l))
  echo "$diff h/s"
  sleep 1
  l=$c
done

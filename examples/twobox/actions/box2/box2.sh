#!/bin/bash

echo "box 2 executing"

ip1="0.0.0.0"
echo "box 1 IP addresses:"
input="IP1.txt"
while IFS= read -r line
do
  echo "IP1: $line"
  ip1="$line"
done < "$input"

echo "box 2 done"
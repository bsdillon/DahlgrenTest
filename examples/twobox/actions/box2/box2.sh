#!/bin/bash

echo "box 2 executing"

ip1="0.0.0.0"
echo "box 1 IP addresses:"
input="IP1.txt"
while IFS= read -r line
do
  ip1="$line"
  echo "IP1: $ip1"
done < "$input"

echo "box 2 done"
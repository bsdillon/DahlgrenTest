#!/bin/bash

echo "box 1 executing"

ip2="0.0.0.0"
input="IP2.txt"
while IFS= read -r line
do
  ip2="$line"
  echo "IP2: $ip2"
done < "$input"

echo "box 1 done"
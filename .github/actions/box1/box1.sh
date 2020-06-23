#!/bin/bash

echo "box 1 executing"

ip2="0.0.0.0"
input="IP2.txt"
while IFS= read -r line
do
  echo "IP2: $line"
  ip2="$line"
done < "$input"

pingTest=$(ping -c 1 "$ip2")

echo "$pingTest"
echo "box 2 done"
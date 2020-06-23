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

echo "Pinging $ip1"
"ping -c1 $ip1" > pingResult
while IFS= read -r line
do
  echo "$line"
done < "pingResult"

echo "box 2 done"
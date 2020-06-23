#!/bin/bash

echo "box 1 executing"

ip2="0.0.0.0"
input="IP2.txt"
while IFS= read -r line
do
  echo "IP2: $line"
  ip2="$line"
done < "$input"

echo "Pinging $ip2"
ping -c1 "$ip2" > pingResult
while IFS= read -r line
do
  echo "$line"
done < "pingResult"
echo "box 2 done"
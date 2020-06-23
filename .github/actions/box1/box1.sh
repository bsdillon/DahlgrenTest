#!/bin/bash

echo "box 1 files:"
## list all files.
while IFS= read -r line
do
  echo "$line"
done < < (ls -l)

echo "box 1 IP addresses:"
input="/IP1.txt"
while IFS= read -r line
do
  echo "IP1: $line"
done < "$input"

input="/IP2.txt"
while IFS= read -r line
do
  echo "IP2: $line"
done < "$input"
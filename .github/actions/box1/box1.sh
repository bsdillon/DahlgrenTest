#!/bin/bash

echo "box 1 files:"
## list all files.
for entry in "/"/*
do
  echo "$entry"
done

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
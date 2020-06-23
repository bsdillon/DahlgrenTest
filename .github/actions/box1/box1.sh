#!/bin/bash

echo "box 1 was here"

input="/IP1.txt"
while IFS= read -r line
do
  echo "IP1: $line"
done

input="/IP2.txt"
while IFS= read -r line
do
  echo "IP2: $line"
done
#!/bin/sh

echo off
echo "Running test with parameters:"
echo "$OPERAND1"
echo "$OPERAND2"
echo ""
set -a diff=$OPERAND2-$OPERAND1
echo "Difference: $diff"
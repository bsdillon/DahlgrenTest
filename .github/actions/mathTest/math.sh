#!/bin/bash

if [ -z ${INPUT_OPERAND1+x} ]; 
then 
   echo "OPERAND1 is unset";
   exit 1
fi

if [ -z ${INPUT_OPERAND2+x} ]; 
then 
   echo "OPERAND2 is unset";
   exit 1
fi

if [ -z ${INPUT_ANSWER+x} ]; 
then 
   echo "ANSWER is unset";
   exit 1
fi

set diff=(($INPUT_OPERAND2-$INPUT_OPERAND1))

if [ $diff = "$INPUT_ANSWER" ]
then
  echo "Pass $INPUT_OPERAND2 - $INPUT_OPERAND1 = $diff"
else
  echo "Fail $INPUT_OPERAND2 - $INPUT_OPERAND1 = $diff <> $INPUT_ANSWER"
  exit 1
fi
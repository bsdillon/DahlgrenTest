#!/bin/sh

if [ -z ${OPERAND1+x} ]; 
then 
   echo "OPERAND1 is unset";
   exit 1
fi

if [ -z ${OPERAND2+x} ]; 
then 
   echo "OPERAND2 is unset";
   exit 1
fi

if [ -z ${ANSWER+x} ]; 
then 
   echo "ANSWER is unset";
   exit 1
fi

let diff=$OPERAND2-$OPERAND1

if [ $diff = $ANSWER ]
then
  echo "Pass $OPERAND2 - $OPERAND1 = $diff"
else
  echo "Fail $OPERAND2 - $OPERAND1 = $diff <> $ANSWER"
  exit 1
fi
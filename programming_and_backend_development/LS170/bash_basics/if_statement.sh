#!/bin/bash

echo 'Input a string'
read variable

echo 'You set variable to '$variable

if [[ -n $variable ]]
then
  echo 'And it is not an empty string'
elif [[ -z $variable ]]
then
  echo 'And it is an empty string'
else
  echo 'And it is not a string'
fi

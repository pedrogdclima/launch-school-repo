#!/bin/bash

# echo Provide an integer

# read integer

integer=10

start=0

until [[ $start -gt $integer ]]
do
  echo $start
  ((start++))
done

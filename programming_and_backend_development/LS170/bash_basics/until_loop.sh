#!/bin/bash

echo Provide an integer

read integer

start=0

until [[ $start -gt $((integer)) ]]
do
  echo $start
  ((start++))
done

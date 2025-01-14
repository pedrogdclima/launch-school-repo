#!/bin/bash

greeting () {
  for str in $names
  do
    echo "Hello $str"
  done
}

echo Provide a list of fist names to be greeted

read names

greeting

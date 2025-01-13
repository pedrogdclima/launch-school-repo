#!/bin/bash

integer=0

end=5

while [[ $integer -le $end ]]
do
  echo $integer
  ((integer++))
done

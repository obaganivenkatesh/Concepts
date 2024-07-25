#!/bin/bash
# this is called array, instead of single value it can hold multiple values
PERSONS=("Rohit" "Kohli" "Gill")

# inside array we always refer values with index and start from 0
echo "first person:${PERSONS[0]}"

echo "All persons:${PERSONS[@]}"
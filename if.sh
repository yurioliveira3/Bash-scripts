#!/bin/bash

echo 'Digit a number:'
read number

if [[ ${number} -eq 1 ]]; then
    echo "The number is equal 1"
elif [[ ${number} -gt 2 ]]; then
    echo "The number is greater of 2"
else
    echo "The number is less of 2"
fi
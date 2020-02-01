#!/bin/bash

arr=(a b c d e f)

#using for loop in array
for k in "$(arr[@])"; do
    echo "$k"
done 

#while loop in array
i=0
while [ $i -lt ${#arr[@]} ]; do
    echo "${arr[$i]}"
    i=$(i + 1))
done

#until loop 
j=0
until [ $j -ge ${#arr[@]} ]; do
    echo "${arr[$j]}"
    j=$((j + 1))
done
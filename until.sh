#!/bin/bash

i=0

#Until loop executes until condition is true
#this is like a while "lt" then
until [[ i -eq 10 ]]; do #Checks if i=10
    echo "i = $i" #Print the value of i
    #i=$((i+1)) #Increment i by 1
    i=$[$i+1] 
done
#!/bin/bash 

array=(`seq 1 10`)

#Print all elements, per line 
for i in "${array[@]}"; do 
    echo "$i"
done

#Print all elements, each quoted separately
echo "${array[@]}"

#Print element at index 0
echo "${array[0]}"

#Print last element using subscript syntax
echo "${array[-1]}"

#Print all elements as a single quoted string
echo "${array[*]}"

#Print all elements from index 1, each quoted separately
echo "${array[@]:1}"

#Print 3 elements from index 1, each quoted separately
echo "${array[@]:1:3}"

#Initialize or update a particular element in the array
array[10]="11"
#now te array index is 0 to 10


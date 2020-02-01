#!/bin/bash 

array1=(a b c d)
array2=(e f g h)
#Merge arrays 
tmp_array=("${array1[@]}" "${array2[@]}")

echo ${tmp_array[@]}
#> a b c d e f g h

#Delete elements of array
unset -v 'tmp_array[0]' # del a 

echo ${tmp_array[@]}

echo ${#tmp_array[@]} #gives the lenght of array

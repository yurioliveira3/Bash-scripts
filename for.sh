#!/bin/bash

# print the sequence "1 2 3 4 5 6 7 8 9 10"
for i in {1..10}; do 
    echo $i
done

#continue 
for i in [series] do
    command 1
    command 2
        if (condition) # Jump command 3 
            continue # skip to the next value in "series"
        fi
    command 3
done

#break
for i in [series] do
    command 4
        if (condition) then # break the loop
            command 5 # Command if the loop needs to be broken
        break
        fi
    command 6 # Command to run if the "condition" is never true
done

# print all vector 2 times
arr=(a b c d e f)
for i in "${arr[@]}";do
    echo "$i"
    for j in "${arr[@]}";do
        echo "$j"
        break
    done
done


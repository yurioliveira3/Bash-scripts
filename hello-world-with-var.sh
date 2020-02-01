#!/usr/bin/env bash 

#Note that spaces cannor be used around the '=' assingment operator
whom_variable="World"

#Use printf to safely output the data
printf "Hello, %s\n" "$whom_variable"
#> Hello, World
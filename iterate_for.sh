#!/bin/bash 

files=( *.sh ) # printa todos os arquivos de extensão ".sh"

# iterate over them
for file in "${files[@]}"; do
    echo "$file"
done
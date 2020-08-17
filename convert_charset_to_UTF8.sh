#!/bin/bash

files=( *.csv ) # printa todos os arquivos de extensão ".csv"

# iterate over them
for file in "${files[@]}"; do
        echo "Ajustando o arquivo $file..."
        sed -i 's/^M$//' $file
        sed -i '1s/^\xEF\xBB\xBF//' $file
        charset="$(file -bi "$file"|awk -F "=" '{print $2}')"
        if [ "$charset" != utf-8]; then 
                iconv -f $charset -t UTF-8 $file > $file
        fi
done

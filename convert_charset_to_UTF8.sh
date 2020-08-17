#!/bin/bash

files=( *.csv ) # printa todos os arquivos de extensão ".csv"

# iterate over them
for file in "${files[@]}"; do
        echo "Ajustando o arquivo $file..."
        sed -i 's/^M$//' $file
        sed -i '1s/^\xEF\xBB\xBF//' $file
        CHARSET="$(file -bi "$file"|awk -F "=" '{print $2}')"
        if [ "$CHARSET" != utf-8 ]; then
                iconv -f "$CHARSET" -t utf8 "$file" -o "$file"
        fi
        echo $(file -i $file)
done

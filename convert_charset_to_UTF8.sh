#!/bin/bash

files=( *.csv ) # printa todos os arquivos de extensão ".csv"

# iterate over them
for file in "${files[@]}"; do
        echo "Fix $file..."
        CHARSET="$(file -bi "$file"|awk -F "=" '{print $2}')"
        if [ "$CHARSET" != utf-8 ]; then
                if [ "$CHARSET" = binary ]; then #Force if binary
                        iconv -f iso-8859-14 -t utf8//TRANSLIT "$file" -o "$file.tmp" #file.tmp is to avoid bus erros
                        mv $file.tmp $file
                else 
                        iconv -f "$CHARSET" -t utf8//TRANSLIT "$file" -o "$file.tmp" #file.tmp is to avoid bus erros
                        mv $file.tmp $file
                fi
        fi
        
        #fix special characters
        sed -i 's/^M$//' $file 
        sed -i '1s/^\xEF\xBB\xBF//' $file

        #print actual charset 
        echo $(file -i $file) 
done

#!/bin/bash

#apresenta o conteudo do arquivo do inicio ao final
echo "cat:"
cat teste.txt 

echo -n -e "\n"
#apresenta o conteudo do arquivo do final ao inicio
echo "tac:"
tac teste.txt

#cat > teste.txt #sobrescreve no arquivo 
#cat >> teste.txt #escreve no arquivo 
#cat --number teste.txt #mostra o numer de linhas do arquivo, contando os espaço em branco
#cat -b teste.txt #mostra o numer de linhas do arquivo, sem contar os espaços em branco
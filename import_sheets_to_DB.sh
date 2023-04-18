#!/bin/bash

#Download das respostas
wget -O test.csv "LINK"

#Drop da tabela antiga
PGPASSWORD='PASSWD' psql -U postgresql -h 127.0.0.1 -d test -c "DROP TABLE IF EXISTS test.test";

#Criação da tabela com os valores consolidados
PGPASSWORD='PASSWD' psql -U postgresql -h 127.0.0.1 -d test -c "CREATE TABLE test.test(
name VARCHAR(255));";

#Import da tabela com os valores consolidados
PGPASSWORD='PASSWD' psql -U postgresql -h 127.0.0.1 -d test -c "\copy test.test 
        from 'test.csv' 
        delimiter ','
        csv header;"

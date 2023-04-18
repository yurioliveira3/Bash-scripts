#!/bin/bash

#Download 
wget -O test.csv "LINK"

#Drop old table
PGPASSWORD='PASSWD' psql -U postgresql -h 127.0.0.1 -d test -c "DROP TABLE IF EXISTS test.test";

#Create new table
PGPASSWORD='PASSWD' psql -U postgresql -h 127.0.0.1 -d test -c "CREATE TABLE test.test(
name VARCHAR(255));";

#Import table with new values
PGPASSWORD='PASSWD' psql -U postgresql -h 127.0.0.1 -d test -c "\copy test.test 
        from 'test.csv' 
        delimiter ','
        csv header;"

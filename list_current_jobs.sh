#!/bin/bash 

#check if process running in a port
lsof -i :8080

#list jobs running
jobs

#list all process
ps -ef 
ps aux

#chech is specific app is runing
ps -ef | grep sshd
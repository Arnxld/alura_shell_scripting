#!/bin/bash

cd /home/arnold
if [ ! -d backup ]
then mkdir backup
fi

mysqldump --user=root -p $1 > /home/arnold/$1.sql
if [ $? -eq 0 ]
then
	echo "Backup realizado com sucesso"
else
	echo "Houve um erro no backup"
fi

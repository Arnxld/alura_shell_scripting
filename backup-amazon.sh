#!/bin/bash
# instalar 'pip install awscli' e 'sudo dnf install awscli'
# criar uma pasta backup_mutillidae_amazon na home

CAMINHO_BACKUP=/home/arnold/backup_mutillidae_amazon
cd $CAMINHO_BACKUP
data=$(date +%F)
if [ ! -d $data ]
then
	mkdir $data
fi

tabelas=$(sudo mysql -u root --password='Angel$0104' mutillidae -e "show tables;" | grep -v Tables)

for tabela in $tabelas
do
	mysqldump -u root --password='Angel$0104' mutillidae $tabela > $CAMINHO_BACKUP/$data/$tabela.sql
done

aws s3 sync $CAMINHO_BACKUP s3://curso-shell-scrip # envia o conteudo do caminho_backup para o bucket da s3

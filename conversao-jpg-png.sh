#!/bin/bash


converte_imagem(){

cd ~/Downloads/imagens-livros
if [ ! -d png ] # verifica se o diretorio png existe, a ! nega o resultado. Então, se não existir 
then 
	mkdir png
fi

for imagem in *.jpg
do
 	local imagem_sem_extensao=$(ls $imagem | awk -F. '{ print  $1 }') # local define uma variável que só pode ser acessada dentro do escopo da função 
	convert  $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png
done
}

# redirecionamento stdin, stderr e stdout
converte_imagem 2>erros_conversao.txt # mensagens de erros serão redirecionadas ao arquivo de erros. No redirecionamento, 2 representa erro.
if [ $? -eq 0 ] # $? pega o status de saída do comando anterior. '-eq 0' significa igual a 0. não está relacionado ao redirecionamento acima.
then
	echo "Conversao realizada com sucesso"
else
	echo "Houve uma falha no processo"
fi


# REDIRECIONAMENTO
# 	https://www.shellscript.sh/tips/redirect/index.html
# 	https://www.geeksforgeeks.org/shell-scripting-standard-input-output-and-error/
#	https://linuxhint.com/bash_stdin_stderr_stdout/


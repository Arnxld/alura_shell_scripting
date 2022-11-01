#!/bin/bash

memoria_total=$(free | grep -i mem | awk '{ print $2 }')
memoria_consumida=$(free | grep -i mem | awk '{ print $3 }')

relacao_memoria=$(bc <<< "scale=2;$memoria_consumida/$memoria_total *100" | awk -F. '{ print $1 }')

if [ $relacao_memoria -gt 50 ]
then
	mail -s "Consumo de memória acima do limite" adm.mutillidae@gmail.com<<del
O consumo de memoria esta acima do limite especificado. Atualmente em $(free -h | grep -i mem | awk '{ print $3 }')
del
else
	echo "consumo de memoria ok em $(free -h | grep -i mem | awk '{ print $3 }')"
fi

#!/bin/bash
#process /home/facom/Documents/GIT/understand.txt

repositorios="/home/gabriel/Documentos/ic2/repositorios"
caminho_da_entrada="/home/gabriel/Documentos/ic2/selecaoDosProjetosAleatoriamente"

while read -r pasta || [[ -n "$pasta" ]] 
do 

	# echo $pasta
	
	var1=$(echo $pasta | awk -F "," '{print $1,$2}')   
	set -- $var1

	framework=$1
	caminhoDoProjeto=$2	

	var1=$(echo $caminhoDoProjeto | awk -F "/" '{print $1,$2}')   
	set -- $var1

	nome_do_dono=$1
	nome_do_projeto=$2

	und create -db $nome_do_projeto.udb -languages java add $repositorios/$caminhoDoProjeto settings -metrics all settings -metricsOutputFile $nome_do_projeto.csv analyze metrics

done < "$caminho_da_entrada/projetosAleatorios.csv"

#"/home/carollima/Documentos/GIT/Codigo/lista-nome.txt"

#create -languages java /home/facom/Documents/Teste/Understand/platform_external_apache-http.udb
#add /home/facom/Documents/GIT/Bibliotecas/platform_external_apache-http /home/facom/Documents/Teste/Understand/platform_external_apache-http.udb
#settings -metrics all 
#settings -metricsOutputFile /home/facom/Documents/Teste/Understand/Tools/platform_external_apache-http.csv 
#analyze 
#metrics


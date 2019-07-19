#!/bin/bash

dir="/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/repositorios_forks"

while read -r linha || [[ -n "$linha" ]] 
	do
		echo linha = $linha
		var1=$(echo $linha | awk -F "," '{print $1,$2,$3,$4}')   
		set -- $var1

		framework=$1
		caminhoDoProjeto=$2
		caminhoDoFork=$3
		hashDoCommitMerge=$4

		var1=$(echo $caminhoDoFork | awk -F "/" '{print $1,$2}')   
		set -- $var1

		dono_fork=$1

		echo $dono_fork
		
		cd $dir/$caminhoDoFork

		git checkout master

		mkdir /home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ4/extraindo_alteracoes_dos_forks/logs/$dono_fork
		
		git log --name-status --stat --pretty=format:"$caminhoDoFork;%h;%s" $hashDoCommitMerge...HEAD > /home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ4/extraindo_alteracoes_dos_forks/logs/$caminhoDoFork.txt
		
	done < "/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ4/extraindo_alteracoes_dos_forks/forks_ahead.txt" 
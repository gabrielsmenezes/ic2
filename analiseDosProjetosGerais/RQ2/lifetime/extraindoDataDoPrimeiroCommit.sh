
#!/bin/bash
diretorio_base="/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ2/lifetime"
diretorio_saida=$diretorio_base"/logs"
repositorios="/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/repositorios"

while read -r linha || [[ -n "$linha" ]] 
	do
		
		var1=$(echo $linha | awk -F "," '{print $1,$2}')   
		set -- $var1

		framework=$1
		nomeCompleto=$2

		var1=$(echo $nomeCompleto | awk -F "/" '{print $1,$2}')   
		set -- $var1

		dono=$1
		projeto=$2
		
		cd $repositorios/$nomeCompleto

		#git checkout master
		
		git log --format="$framework,$nomeCompleto,%ai" --reverse | head -1
	done < /home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ1/selecaoDosProjetosAleatoriamente/projetosAleatorios.csv > $diretorio_base/initial_commit_date.csv

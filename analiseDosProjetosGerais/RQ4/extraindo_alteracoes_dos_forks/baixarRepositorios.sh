#! /bin/bash

cat 'forks_ahead.txt' | while read LINE; do
    echo $LINE
    cd '/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/repositorios_forks'

    var1=$(echo $LINE | awk -F "," '{print $1,$2,$3,$4,$5,$6}')   
	set -- $var1
	nomeCompletoDoRepositorio=$3

	var1=$(echo $nomeCompletoDoRepositorio | awk -F "/" '{print $1,$2}')   
	set -- $var1
	nomeDoUser=$1
	nomeDoRepositorio=$2

    mkdir $nomeDoUser
    cd $nomeDoUser
    git clone https://github.com/$nomeDoUser/$nomeDoRepositorio
done

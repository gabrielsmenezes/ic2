import os, fnmatch, io

def find(pattern, path):
	result = []
	for root, dirs, files in os.walk(path):
		for name in files:
			if fnmatch.fnmatch(name, pattern):
				result.append(os.path.join(root, name))
	return result

projetos = open('/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ1/selecaoDosProjetosAleatoriamente/projetosAleatorios.csv')

for projeto in projetos:
	
	projeto = projeto.replace("\n", "")
	projeto = projeto.split(",")

	projeto = {
		"framework": projeto[0],
		"nome_completo": projeto[1]
	}
	
	pasta = '/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/repositorios/'+projeto["nome_completo"]+'/'
	
	caminhoDosJava = find('*.java', pasta)

	conjuntoDeImports = set()

	if(projeto["framework"] == "Android"):
		for caminhoJava in caminhoDosJava:
			try:
				arquivoJava = open(caminhoJava)
				for linhaJava in arquivoJava:
					if linhaJava.split(' ')[0] == 'import' :
						biblioteca = linhaJava.split(' ')[1]
						if biblioteca.split('.')[0] == 'android':
							conjuntoDeImports.add(biblioteca.replace('\n', '').replace(';', ''))
			except:
				continue
				
	elif (projeto["framework"] == "Spring"):
		for caminhoJava in caminhoDosJava:
			try:
				arquivoJava = open(caminhoJava)
				for linhaJava in arquivoJava:
					if linhaJava.split(' ')[0] == 'import' :
						biblioteca = linhaJava.split(' ')[1]
						if biblioteca.split('.')[0] == 'org' and biblioteca.split('.')[1] == 'springframework' and biblioteca.split('.')[2] == 'boot':
							conjuntoDeImports.add(biblioteca.replace('\n', '').replace(';', ''))
			except:
				continue


	print(projeto["framework"]+","+projeto["nome_completo"] +","+ "%0.2f" % (len(conjuntoDeImports) / len(caminhoDosJava)))
import os, fnmatch, Versionamento

def find(pattern, path):
	result = []
	for root, dirs, files in os.walk(path):
		for name in files:
			if fnmatch.fnmatch(name, pattern):
				result.append(os.path.join(root, name))
	return result

def devolveArquivo(caminho):
	return open(caminho, 'r')

p = devolveArquivo("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ1/selecaoDosProjetosAleatoriamente/projetosAleatorios.csv")

projetos = list()

for projeto in p:
	projeto = projeto.replace("\n", "")
	projeto = {
		"framework": projeto.split(",")[0],
		"dono":projeto.split(",")[1].split("/")[0],
		"nome":projeto.split(",")[1].split("/")[1]
	}
	projetos.append(projeto)


v = Versionamento.Versionamento()

print("framework,projeto,arquivo,minSdkVersion/version,targetSdk/groupId,compileSdk/artifactId")
for projeto in projetos:
	if projeto["framework"] == "Android":

		caminhosDoBuild = find('build.gradle', "/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/repositorios/"+projeto['dono']+"/"+projeto["nome"])		
		
		for caminho in caminhosDoBuild:
			arquivo = devolveArquivo(caminho)
			informacoesDeVersaoDoAndroidNoBuild = v.retornaDadosDoVersionamentoDoBuild(str(arquivo.read()))
			print(projeto['framework']+","+projeto["dono"]+"/"+projeto["nome"]+","+caminho+","+informacoesDeVersaoDoAndroidNoBuild["minSdkVersion"]+","+informacoesDeVersaoDoAndroidNoBuild["targetSdk"]+","+informacoesDeVersaoDoAndroidNoBuild["compileSdk"])


	elif projeto["framework"] == "Spring":
		
		caminhos = find('pom.xml', "/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/repositorios/"+projeto['dono']+"/"+projeto["nome"])
		for caminho in caminhos:
			arquivo = devolveArquivo(caminho)
			informacoesDeVersaoDoSpring = v.retornaDadosDoVersionamentoDoPOM(str(arquivo.read()))
			print(projeto['framework']+","+projeto["dono"]+"/"+projeto["nome"]+","+caminho+","+informacoesDeVersaoDoSpring)
import os, fnmatch, Versionamento

def find(pattern, path):
	result = []
	for root, dirs, files in os.walk(path):
		for name in files:
			if fnmatch.fnmatch(name, pattern):
				result.append(os.path.join(root, name))
	return result


projetos = list()
with open("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ1/selecaoDosProjetosAleatoriamente/projetosAleatorios.csv") as entrada:
    for linha in entrada:
        linha=linha.replace("\n","")
        projetos.append(linha.split(","))

print("framework,projeto,caminho,minSdkVersion/springboot,targetSdkVersion")

for projeto in projetos:
    tem_import = False
    if (projeto[0] == "Android"):
        gradles = find ("build.gradle", "/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/repositorios/"+projeto[1])
        for gradle in gradles:
            arquivo_gradle = open(gradle).read()
            if("minSdkVersion" in arquivo_gradle and "targetSdkVersion" in arquivo_gradle):
                tem_import = True

                posicao_inicial = arquivo_gradle.find("minSdkVersion")
                
                minSdkVersion = arquivo_gradle[posicao_inicial:]

                posicao_inicial = minSdkVersion.find(" ")

                minSdkVersion = minSdkVersion[posicao_inicial+1:]

                posicao_final = minSdkVersion.find("\n")
                
                minSdkVersion = minSdkVersion[:posicao_final]
            
                # target
            
                posicao_inicial = arquivo_gradle.find("targetSdkVersion")
                
                targetSdkVersion = arquivo_gradle[posicao_inicial:]

                posicao_inicial = targetSdkVersion.find(" ")

                targetSdkVersion = targetSdkVersion[posicao_inicial+1:]

                posicao_final = targetSdkVersion.find("\n")
                
                targetSdkVersion = targetSdkVersion[:posicao_final]

                print(projeto[0]+","+projeto[1]+","+gradle+","+minSdkVersion+","+targetSdkVersion)
        if(tem_import == False):
            print(projeto[0]+","+projeto[1]+","+"Nao encontrado")

    if(projeto[0]=="Spring"):
        poms = find("pom.xml", "/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/repositorios/"+projeto[1])
        for pom in poms:
            arquivo_pom = open(pom).read()
            if("org.springframework.boot" in arquivo_pom):
                tem_import = True
                posicao = arquivo_pom.find("org.springframework.boot")

                arquivo = arquivo_pom[posicao:]

                posicao= arquivo.find("version")

                arquivo = arquivo[posicao:]

                posicao = arquivo.find(">")

                arquivo = arquivo[posicao+1:]

                posicao = arquivo.find("<")

                versao = arquivo[:posicao]
                print(projeto[0]+","+projeto[1]+","+pom+","+versao)
        if(tem_import == False):
            print(projeto[0]+","+projeto[1]+","+"Nao encontrado")
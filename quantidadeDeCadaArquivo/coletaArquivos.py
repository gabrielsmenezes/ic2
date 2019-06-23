import os, fnmatch

def find(pattern, path):
	result = []
	for root, dirs, files in os.walk(path):
		for name in files:
			if fnmatch.fnmatch(name, pattern):
				result.append(os.path.join(root, name))
	return result

def retornaArquivo(nomeDoArquivo):
	arquivo = ''
	try:
		arquivo = open(nomeDoArquivo, 'r')
	except Exception as e:
		output  = io.BytesIO()
		arquivo = io.TextIOWrapper(output, encoding='cp1252', line_buffering=True)
	return arquivo


arquivoComNomeDosProjetos = retornaArquivo('/home/gabriel/Documentos/ic2/selecaoDosProjetosAndroidSpring/listaDeProjetos.csv')

print('framework,'+'project'+','+'java'+','+'properties'+','+'jar'+','+'build.gradle'+','+'pom.xml'+','+'manifest.xml'+','+'xml'+','+'bat'+','+'md'+','+'adoc'+','+'README'+','+'yaml'+','+'txt'+','+'sh'+','+'travis.yml'+','+'yml'+','+'cmd'+','+'kt'+','+'json'+','+'others'+','+'numberOfFiles')

for linha in arquivoComNomeDosProjetos:
	

	linha = linha.split('\n')[0]
	linha = linha.split(',')
	
	#linha[0] == framework
	#linha[1] == nome do repositorio
	#linha[2] == numero de estrelas
	repositorio = (linha[0], linha[1], linha[2])

	# print(repositorio)

	pasta = '/home/gabriel/Documentos/ic2/repositorios/' + repositorio[1]

	caminhoDosJava = find('*.java', pasta)

	caminhoDosProperties = find('*.properties', pasta)

	caminhoDosJar = find('*.jar', pasta)
	
	caminhoDosBuildGradle = find('*build.gradle', pasta)
	
	caminhoDosPom = find('*pom.xml', pasta)

	caminhoDosManifest = find('AndroidManifest.xml', pasta)

	caminhoDosXml = find('*.xml', pasta)

	caminhoDosBat = find('*.bat', pasta)

	caminhoDosMd = find('*.md', pasta)
	
	caminhoDosAdoc = find('*.adoc', pasta)

	caminhoDosRead = find('*README.md', pasta)

	caminhoDosYaml = find('*.yaml', pasta)

	caminhoDosTxt = find('*.txt', pasta)

	caminhoDosSh = find('*.sh', pasta)

	caminhoDosYml = find('*.yml', pasta)

	caminhoDosCmd = find('*.cmd', pasta)

	caminhoDosKt = find('*.kt', pasta)

	caminhoDosJson = find('*.json', pasta)
	
	caminhoDosTravis = find('*travis.yml', pasta)

	numeroDeTodos = find('*.*', pasta)

	count = 0

	for arquivo in numeroDeTodos:
		if not ".git" in arquivo:
			count += 1

	numeroDeTodos = count - (len(caminhoDosJava) + len(caminhoDosProperties) + len(caminhoDosJar) +	len(caminhoDosBuildGradle) + len(caminhoDosXml) + len(caminhoDosBat) + len(caminhoDosMd) + len(caminhoDosAdoc) +  len(caminhoDosYaml) + len(caminhoDosTxt) + len(caminhoDosSh) + len(caminhoDosYml) + len(caminhoDosCmd) + len(caminhoDosKt) + len(caminhoDosJson) )

	print(repositorio[0]+','+repositorio[1]+','+ str(len(caminhoDosJava)) +','+ str(len(caminhoDosProperties)) +','+ str( len(caminhoDosJar))  +','+ str(len(caminhoDosBuildGradle))  +','+ str(len(caminhoDosPom))   +','+ str(len(caminhoDosManifest))   +','+ str(len(caminhoDosXml))   +','+ str(len(caminhoDosBat))   +','+ str(len(caminhoDosMd))   +','+ str(len(caminhoDosAdoc))   +','+ str(len(caminhoDosRead))   +','+ str(len(caminhoDosYaml))   +','+ str(len(caminhoDosTxt))   +','+ str(len(caminhoDosSh))   +','+ str(len(caminhoDosTravis))   +','+ str(len(caminhoDosYml))   +','+ str(len(caminhoDosCmd))   +','+ str(len(caminhoDosKt))   +','+ str(len(caminhoDosJson)) +','+ str(numeroDeTodos) + ',' + str(count))
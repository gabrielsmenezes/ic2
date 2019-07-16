import http.client
import json

def dictToSet(chaves):
	conjunto = set()
	for chave in chaves:
		conjunto.add(chave)
	return conjunto


def retornaArquivo(nomeDoArquivo):
	arquivo = ''
	try:
		arquivo = open(nomeDoArquivo, 'r')
	except Exception as e:
		output  = io.BytesIO()
		arquivo = io.TextIOWrapper(output, encoding='cp1252', line_buffering=True)
	return arquivo

def criaCabecalho():
	cabecalho = {
		'Content-type': 'application/json',
		'User-Agent': 'gabrielsmenezes',
		'Authorization': 'Bearer 04111d595e3ec22b9d3bd2399de8326b9186812f'
	}
	return cabecalho

def retornaConjuntoDeContribuidores(dono, nomeDoRepositorio):
	conexao = http.client.HTTPSConnection('api.github.com', 443)
	contribuidores = []
	corpoDaRequisicaoEmJSON = ""
	endpoint = "https://api.github.com/repos/" + dono + "/" + nomeDoRepositorio + "/contributors?anon=1&page=1"
	conexao.request('GET', endpoint, corpoDaRequisicaoEmJSON, criaCabecalho())
	response = conexao.getresponse()
	respostaEmJson = json.loads(response.read().decode())
	page = 2

	while (respostaEmJson != []):
		for contribuidor in respostaEmJson:
			if contribuidor['type'] == 'Anonymous':
				contribuidores.append({
						'name': contribuidor['name'],
						'email': contribuidor['email']
					})

		endpoint = "https://api.github.com/repos/" + dono + "/" + nomeDoRepositorio + "/contributors?anon=1&page="+str(page)
		conexao.request('GET', endpoint, corpoDaRequisicaoEmJSON, criaCabecalho())
		response = conexao.getresponse()
		respostaEmJson = json.loads(response.read().decode())
		page+=1
	return contribuidores

def imprime_contribuidores_em_comum(codeSamples, contribuidoresDoFramework):
	for codeSample in codeSamples:
		contribuidoresEmComum = []
		
		dono = codeSample["nome"].split("/")[0]
		projeto = codeSample["nome"].split("/")[1]

		contribuidoresDoSample = retornaConjuntoDeContribuidores(dono, projeto)
		
		for contribuidorDoSample in contribuidoresDoSample:
			for contribuidorDoFramework in contribuidoresDoFramework:

				if contribuidorDoFramework['name'] == contribuidorDoSample['name']:
					contribuidoresEmComum.append(contribuidorDoSample)
					break

				elif contribuidorDoFramework['email'] == contribuidorDoSample['email']:
					contribuidoresEmComum.append(contribuidorDoSample)
					break
		print(codeSample["framework"]+","+codeSample["nome"]+','+str(len(contribuidoresDoFramework))+','+str(len(contribuidoresDoSample))+','+str(len(contribuidoresEmComum)))

# Para cada framework
# 	Criar um conjunto de contribuidores e Inserir todos os contribuidores

contribuidoresDoSpring = retornaConjuntoDeContribuidores('spring-projects','spring-boot')
contribuidoresDoAndroid = retornaConjuntoDeContribuidores('aosp-mirror','platform_frameworks_base')

projetos = open("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ1/selecaoDosProjetosAleatoriamente/projetosAleatorios.csv")

springSamples = list()
androidSamples = list()

print("framework,projeto,contribuidores_do_framework,contribuidores_do_sample,contribuidores_comum")

for projeto in projetos:
	if ("#" in projeto):
		continue
	projeto = projeto.replace("\n", "")
	projeto = projeto.split(",")

	projeto = {
		"framework": projeto[0],
		"nome": projeto[1]
	}

	if(projeto["framework"] == "Spring"):
		springSamples.append(projeto)
	elif(projeto["framework"] == "Android"):
		androidSamples.append(projeto)


imprime_contribuidores_em_comum(springSamples, contribuidoresDoSpring)
imprime_contribuidores_em_comum(androidSamples, contribuidoresDoAndroid)
import http.client
import json
import time

def criaConexaoComServidor():
	return http.client.HTTPSConnection('api.github.com', 443)


def criaCabecalho():
	cabecalho = {
		'Content-type': 'application/json',
		'User-Agent': 'gabrielsmenezes',
		'Authorization': 'Bearer 82168313e7fbd3d04983e796555596b4b955d08b'
	}
	return cabecalho

def getRepositories():
	numero_de_estrelas = 80000
	resposta = dict()
	conexao = criaConexaoComServidor()
	cabecalho = criaCabecalho()
	corpoDaRequisicaoEmJSON = ""
	with open ('saida.csv', 'w') as arquivo:
		while(len(resposta) < 5000):
			try:
				conexao.request('GET', "/search/repositories?q=language:java"+"+stars:<="+str(numero_de_estrelas)+"&sort=stars&order=desc", corpoDaRequisicaoEmJSON, cabecalho)
				response = conexao.getresponse()
				rate_limit_remaing = int(response.headers["X-RateLimit-Remaining"][0])
				if (rate_limit_remaing < 5):
					print("Spleeping")
					time.sleep(10)
					print("waking up")
				respostaEmJson = json.loads(response.read().decode())
				repositorios = respostaEmJson["items"]
				for repositorio in repositorios:
					full_name = repositorio['full_name']
					stargazers_count = repositorio['stargazers_count']
					resposta[full_name] = stargazers_count	
					numero_de_estrelas = stargazers_count
					print(full_name, numero_de_estrelas)
					arquivo.write("%s,%s\n" % (full_name, numero_de_estrelas))
					print("Projetos ja encontrados: " + str(len(resposta)))
			except Exception as identifier:
				print(identifier.__str__())
				print("============================\n")
				print(respostaEmJson)
	return resposta



if __name__ == "__main__":
	getRepositories()
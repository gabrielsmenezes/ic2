import http.client
import json
import time


class Conexao:

	def __init__(self):
		pass

	def criaConexaoComServidor(self):
		return http.client.HTTPSConnection('api.github.com', 443)


	def criaCabecalho(self):
		cabecalho = {
			'Content-type': 'application/json',
			'User-Agent': 'gabrielsmenezes',
			'Authorization': 'Bearer a98cb10f229115299a35d7e21ee137ba2bf8ec14'
		}
		return cabecalho
	
	def getRepositories(self):
		
		resposta = dict()
		for i in range(1, 35):
			conexao = self.criaConexaoComServidor()
			cabecalho = self.criaCabecalho()
			corpoDaRequisicaoEmJSON = ""		
			time.sleep(60)
			print(i)
			conexao.request('GET', "/search/repositories?q=language:java&sort=stars&order=desc&page="+str(i), corpoDaRequisicaoEmJSON, cabecalho)
			response = conexao.getresponse()
			respostaEmJson = json.loads(response.read().decode())
			try:
				repositorios = respostaEmJson['items']
				for i in range(0, 30):
					full_name = repositorios[i]['full_name']
					stargazers_count = repositorios[i]['stargazers_count']
					resposta[full_name] = stargazers_count
			except:
				print(respostaEmJson)

		return resposta
import http.client
import json

class Conexao:

	def __init__(self):
		pass

	def criaConexaoComServidor(self):
		return http.client.HTTPSConnection('api.github.com', 443)


	# def criaCabecalho(self):
	# 	cabecalho = {
	# 		'Content-type': 'application/json',
	# 		'User-Agent': 'gabrielsmenezes',
	# 		'Authorization': 'Bearer afe33 ba8f0aa66ce852c317ee637448c4daa59b4'
	# 	}
	# 	return cabecalho;
	
	def getRepositories(self):
		conexao = self.criaConexaoComServidor()
		cabecalho = self.criaCabecalho()
		corpoDaRequisicaoEmJSON = ""
		conexao.request('GET', "/search/repositories?q=language:java&sort=star&order=desc&page=0", corpoDaRequisicaoEmJSON, cabecalho)

		response = conexao.getresponse()
		respostaEmJson = json.loads(response.read().decode());

		return respostaEmJson
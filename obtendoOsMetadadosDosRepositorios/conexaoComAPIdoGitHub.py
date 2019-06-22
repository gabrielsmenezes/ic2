import datetime
import os
import Conexao
import time


def retornaNomeDoOwner(line):
	linhaQuebrada = line.split('/')
	return linhaQuebrada[0]

def retornaNomeDoRepo(line):
	linhaQuebrada = line.split('/')
	nomeDoRepositorio = linhaQuebrada[1].replace('\n', '')
	return nomeDoRepositorio
	

conexao = Conexao.Conexao()

projetos = open('/home/gabriel/Documentos/ic2/selecaoDosProjetosAndroidSpring/listaDeProjetos.csv', 'r')
cabecalho = 'framework,'+'repository,'+'forks,'+'diskUsage_KB,'+'stargazers,'+'watchers,'+'issues,'+'commits,'+'pullRequests,'+'updatedAt,'+'projects\n'
print(cabecalho)
with open ("/home/gabriel/Documentos/ic2/obtendoOsMetadadosDosRepositorios/listaDeMetadadosDosProjetos.csv", "a") as saida:
	saida.write(cabecalho)

for line in projetos:
	line = line.replace("\n", "").split(",")
	repo = (line[0], line[1], line[2])

	repositorio = conexao.retornaRepositorio(retornaNomeDoOwner(repo[1]), retornaNomeDoRepo(repo[1]))
	
	with open ("/home/gabriel/Documentos/ic2/obtendoOsMetadadosDosRepositorios/listaDeMetadadosDosProjetos.csv", "a") as saida:
		try:
			dados = str(repo[0])+','+ str(repositorio['nameWithOwner'])+','+ str(repositorio['forkCount'])+','+ str(repositorio['diskUsage'])+','+ str(repositorio['stargazers']['totalCount'])+','+ str(repositorio['watchers']['totalCount'])+','+ str(repositorio['issues']['totalCount'])+','+ str(repositorio['ref']['target']['history']['totalCount'])+','+ str(repositorio['pullRequests']['totalCount'])+','+ str(repositorio['updatedAt'])+','+ str(repositorio['projects']['totalCount'])
			print(dados)
			saida.write(dados + '\n')

		except Exception as identifier:
			dados = str(repo[0])+','+ str(repositorio['nameWithOwner'])+','+ str(repositorio['forkCount'])+','+ str(repositorio['diskUsage'])+','+ str(repositorio['stargazers']['totalCount'])+','+ str(repositorio['watchers']['totalCount'])+','+ str(repositorio['issues']['totalCount'])+','+ str("?")+','+ str(repositorio['pullRequests']['totalCount'])+','+ str(repositorio['updatedAt'])+','+ str(repositorio['projects']['totalCount'])
			print(dados)
			saida.write(dados + '\n')
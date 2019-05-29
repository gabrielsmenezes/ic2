import os
import Conexao


def executar():
	conexao = Conexao.Conexao()
	repositorios = conexao.getRepositories()
	for repositorio in repositorios:
		print(repositorio, ',', repositorios[repositorio])

if __name__ == "__main__":
	executar()
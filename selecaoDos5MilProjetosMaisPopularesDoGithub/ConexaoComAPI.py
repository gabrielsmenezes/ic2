import os
import Conexao
import time


def executar(nomeDoArquivoTxt):
	conexao = Conexao.Conexao()
	repositorios = conexao.getRepositories()
	print(repositorios)

def main():
	executar('springsamples')

main()
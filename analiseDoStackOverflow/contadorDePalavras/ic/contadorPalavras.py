def retornaArquivo(nomeDoArquivo):
	arquivo = ''
	try:
		arquivo = open(nomeDoArquivo, 'r')
	except Exception as e:
		output  = io.BytesIO()
		arquivo = io.TextIOWrapper(output, encoding='cp1252', line_buffering=True)
	return arquivo


contadorDePalavras = {}

arquivo = retornaArquivo("tags3.csv")

for linha in arquivo:
	linha = linha.lower()
	linha = linha.split("\n")
	linha = linha[0]

	mensagemDividida = linha.split("><")
	for palavra in mensagemDividida:
		palavra = palavra.replace("<","")
		palavra = palavra.replace(">","")

		if palavra in contadorDePalavras:
			contadorDePalavras[palavra] = contadorDePalavras[palavra] + 1
		else:
			contadorDePalavras[palavra] = 1

for palavra in contadorDePalavras:
	print(palavra+",", contadorDePalavras[palavra])

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

#verificar se eh android
def ehAndroid(caminhoDoProjeto):
    caminhoDosJava = find('*.java', caminhoDoProjeto)
    
    numeroDeImportacoes = 0
	
    for caminhoJava in caminhoDosJava:
        
        arquivoJava = retornaArquivo(caminhoJava)

        for linhaJava in arquivoJava:
		
            if linhaJava.split(' ')[0] == 'import' :
                biblioteca = linhaJava.split(' ')[1]
                biblioteca = biblioteca.split('.')
		
                if biblioteca[0] == 'android':
                    return True
    return False

#Ler do arquivo os enderecos
    #para cada endereco:
        #baixar o repositorio
        #Verificar se eh spring ou android
            #se for android printa ('android', nomeDoRepositorio)
if(ehAndroid('repositorios/android-testdpc')):
    print("Eh Android")
else:
    print("Nao eh android")
            #se for spring printa ('spring', nomeDoRepositorio)
            #apagar projeto

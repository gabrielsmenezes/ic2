import os, fnmatch
from git import Repo
import shutil

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
    
    for caminhoJava in caminhoDosJava:
        
        arquivoJava = retornaArquivo(caminhoJava)

        for linhaJava in arquivoJava:
		
            if linhaJava.split(' ')[0] == 'import' :
                biblioteca = linhaJava.split(' ')[1]
                biblioteca = biblioteca.split('.')
		
                if biblioteca[0] == 'android':
                    return True
    return False

#verificar se eh spring
def ehSpring(caminhoDoProjeto):
    caminhoDosJava = find('*.java', caminhoDoProjeto)
    
    for caminhoJava in caminhoDosJava:
        
        arquivoJava = retornaArquivo(caminhoJava)

        for linhaJava in arquivoJava:
            if linhaJava.split(' ')[0] == 'import' :
                biblioteca = linhaJava.split(' ')[1]
                biblioteca = biblioteca.split('.')
                if biblioteca[0] == 'org' and biblioteca[1] == 'springframework' and biblioteca[2] == 'boot':
                    return True
    return False





#Ler do arquivo os enderecos
arquivoComOsEnderecos = retornaArquivo("/home/gabriel/Documentos/ic2/selecaoDos5MilProjetosMaisPopularesDoGithub/saida.csv")
with open ('listaDeProjetos.csv', "w") as arquivo:
#para cada endereco:
    for linha in arquivoComOsEnderecos:
        linha = linha.replace("\n", "")
        nomeDoRepositorio = linha.split(",")[0]
        git_url = "https://github.com/" + nomeDoRepositorio + ".git"
        repo_dir = "/home/gabriel/Documentos/ic2/repositorios/"
        try:
            #baixar o repositorio
            print("Baixando %s" % (nomeDoRepositorio))
            Repo.clone_from(git_url, repo_dir+nomeDoRepositorio)
            print("%s baixado com sucesso" % (nomeDoRepositorio))            
            #Verificar se eh spring ou android
            #se for android printa ('android', nomeDoRepositorio)
            print("Verificando se %s eh android" % (nomeDoRepositorio))
            if(ehAndroid(repo_dir+nomeDoRepositorio)):
                print("%s eh android" % (nomeDoRepositorio))
                arquivo.write("%s,%s" % ('Android', nomeDoRepositorio))
            elif(ehSpring(repo_dir+nomeDoRepositorio)):
                print("Verificando se %s eh spring" % (nomeDoRepositorio))            
                print("%s eh spring" % (nomeDoRepositorio))
                arquivo.write("%s,%s" % ('Spring', nomeDoRepositorio))
            else:
                print("Apagando %s" % (nomeDoRepositorio))
                if (len(os.listdir(repo_dir+nomeDoRepositorio.split('/')[0])) > 1):
                    shutil.rmtree(repo_dir+nomeDoRepositorio, ignore_errors=True)
                else:
                    shutil.rmtree(repo_dir+nomeDoRepositorio.split('/')[0], ignore_errors=True)
                print("%s apagado com sucesso" % (nomeDoRepositorio))
        except Exception as e:
            print(e.__str__())
            break
        

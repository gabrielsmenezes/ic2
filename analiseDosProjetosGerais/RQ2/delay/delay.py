from git import Repo
import datetime

#ler o arquivo com o nome de todos os caminhos dos poms e gradles
poms = open("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ2/extraindoVersaoAtualDoFramework/Spring.csv")
gradles = open("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ2/extraindoVersaoAtualDoFramework/Android.csv")
spring_versions = open("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ2/delay/logs/spring-versions.txt")

arquivos_de_configuracao = list()
versoes_do_spring = dict()
versoes_do_android = {
    "19":datetime.datetime.strptime("2013-10-31 00:00:00 +0000", "%Y-%m-%d %H:%M:%S %z"),
    "20":datetime.datetime.strptime("2014-06-25 00:00:00 +0000", "%Y-%m-%d %H:%M:%S %z"),
    "21":datetime.datetime.strptime("2014-10-17 00:00:00 +0000", "%Y-%m-%d %H:%M:%S %z"),
    "22":datetime.datetime.strptime("2015-03-09 00:00:00 +0000", "%Y-%m-%d %H:%M:%S %z"),
    "23":datetime.datetime.strptime("2015-08-17 00:00:00 +0000", "%Y-%m-%d %H:%M:%S %z"),
    "24":datetime.datetime.strptime("2016-06-15 00:00:00 +0000", "%Y-%m-%d %H:%M:%S %z"),
    "25":datetime.datetime.strptime("2016-11-22 00:00:00 +0000", "%Y-%m-%d %H:%M:%S %z"),
    "26":datetime.datetime.strptime("2017-06-08 00:00:00 +0000", "%Y-%m-%d %H:%M:%S %z"),
    "27":datetime.datetime.strptime("2017-12-05 00:00:00 +0000", "%Y-%m-%d %H:%M:%S %z"),
    "28":datetime.datetime.strptime("2018-07-25 00:00:00 +0000", "%Y-%m-%d %H:%M:%S %z")}

for gradle in gradles:
    gradle = gradle.replace("\n", "")
    gradle = gradle.split(",")
    if (gradle[0] == "framework"):
        continue
    configuracao = {
        "framework": gradle[0],
        "dono": gradle[1].split("/")[0],
        "projeto":gradle[1].split("/")[1],
        "caminho": gradle[2]
    }
    arquivos_de_configuracao.append(configuracao)

for pom in poms:
    pom = pom.replace("\n", "")
    pom = pom.split(",")
    if (pom[0] == "framework"):
        continue
    configuracao = {
        "framework": pom[0],
        "dono": pom[1].split("/")[0],
        "projeto":pom[1].split("/")[1],
        "caminho": pom[2]
    }
    arquivos_de_configuracao.append(configuracao)


for version in spring_versions:
    version = version.replace("\n", "")
    version = version.split(";")
    versoes_do_spring[version[1]] = datetime.datetime.strptime(version[0], "%Y-%m-%d %H:%M:%S %z")


#para cada arquivo de config
for arquivo in arquivos_de_configuracao:
    primeiro = True
    versao_corrente = ''
#   para cada commit
    arquivo_de_commits = open("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ2/delay/logs/"+arquivo["projeto"]+".txt")
    commits = list()
    for linhas_commits in arquivo_de_commits:
        linhas_commits = linhas_commits.replace("\n", "")
        linhas_commits = linhas_commits.split(";")
        #2010-06-18 12:33:58 +0000
        commit = {
             "hash": linhas_commits[0],
             "data": datetime.datetime.strptime(linhas_commits[1], "%Y-%m-%d %H:%M:%S %z")
        }
        commits.append(commit)
# dou checkout no commit
    for commit in commits:
        try:
            repo = Repo("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/repositorios/"+arquivo["dono"]+"/"+arquivo["projeto"])
            repo.git.checkout(commit["hash"])
            arquivo_de_configuracao = open(arquivo["caminho"]).read()
        except:
            continue

        if ("Spring"==arquivo["framework"]):
            posicao = arquivo_de_configuracao.find("org.springframework.boot")
            versao = arquivo_de_configuracao[posicao:]
            posicao= versao.find("version")
            versao = versao[posicao:]
            posicao = versao.find(">")
            versao = versao[posicao+1:]
            posicao = versao.find("<")
            versao = versao[:posicao]
            versao = versao.replace("'", "")
            if ("RELEASE" in versao and versao != versao_corrente and "2.2.0" not in versao):
                # calcular o delay
                delay = commit["data"] - versoes_do_spring[versao]
                if(primeiro == True):
                    primeiro = False
                    versao_corrente = versao
                    continue
                print(arquivo["framework"]+","+arquivo["dono"]+"/"+arquivo["projeto"]+","+arquivo["caminho"]+ ","+ versao+ ","+ str(delay.days)+","+"Data do commit: "+commit["data"].strftime("%Y-%m-%d %H:%M:%S") +","+"Data de lancamento da versao "+versoes_do_android[versao].strftime("%Y-%m-%d %H:%M:%S"))
                #atualizar o versao_corrente
                versao_corrente = versao
        elif ("Android" == arquivo["framework"]):
            posicao_inicial = arquivo_de_configuracao.find("compileSdkVersion")
            compileSdkVersion = arquivo_de_configuracao[posicao_inicial:]
            posicao_inicial = compileSdkVersion.find(" ")
            compileSdkVersion = compileSdkVersion[posicao_inicial+1:]
            posicao_final = compileSdkVersion.find("\n")
            compileSdkVersion = compileSdkVersion[:posicao_final]
            versao = compileSdkVersion
            if (versao != '' and len(versao) < 3 and int(versao) > 19 and versao != versao_corrente):
                delay = commit["data"] - versoes_do_android[versao]
                if(primeiro == True):
                    primeiro = False
                    versao_corrente = versao
                    continue
                print(arquivo["framework"]+","+arquivo["dono"]+"/"+arquivo["projeto"]+","+arquivo["caminho"]+ ","+ versao+ ","+ str(delay.days)+","+"Data do commit: "+commit["data"].strftime("%Y-%m-%d %H:%M:%S") +","+"Data de lancamento da versao "+versoes_do_android[versao].strftime("%Y-%m-%d %H:%M:%S")) 
                versao_corrente = versao
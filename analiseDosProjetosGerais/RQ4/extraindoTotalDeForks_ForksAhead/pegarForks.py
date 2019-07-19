from github import Github
import time

g = Github("64a61ceae41626d6cbf42dd3dbbfd2e9fc61770a")

projetos = open("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ1/selecaoDosProjetosAleatoriamente/projetosAleatorios.csv")
with open("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ4/extraindoTotalDeForks_ForksAhead/forks.csv", "a") as saida:
    saida.write("framework,projeto,forks,forks_ahead\n")
print("framework,projeto,forks,forks_ahead")

for projeto in projetos:

    projeto = projeto.split(",")
    
    repo = g.get_repo(projeto[1])
    
    print("Rate limiting: " + str(g.rate_limiting[0]))

    forks_ahead = 0
    if(g.rate_limiting[0] < repo.forks_count):
        tempo_para_dormir = int((g.rate_limiting_resettime - time.time()))
        print("Dormindo por : " + str(tempo_para_dormir / 60) + " minutos")
        time.sleep(tempo_para_dormir)
    for fork in repo.get_forks():
        try:
            comparacao = repo.compare("master",fork.owner.login+":master")
            if (comparacao.ahead_by > 0):
                forks_ahead = forks_ahead + 1
        except:
            continue
    with open("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ4/extraindoTotalDeForks_ForksAhead/forks.csv", "a") as saida:
        saida.write(projeto[0]+","+projeto[1]+","+str(repo.forks_count)+","+str(forks_ahead)+"\n")
    print(projeto[0]+","+projeto[1]+","+str(repo.forks_count)+","+str(forks_ahead))
from github import Github
import time

g = Github("64a61ceae41626d6cbf42dd3dbbfd2e9fc61770a")

projetos = open("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ1/selecaoDosProjetosAleatoriamente/projetosAleatorios.csv")
with open("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ4/extraindo_forks_behind_ahead_commitDeMerge/forks.csv", "a") as saida:
    saida.write("framework,projeto,base_commit,behind_by,ahead_by\n")
print("framework,nome_projeto,nome_fork,base_commit,behind_by,ahead_by")

for projeto in projetos:

    projeto = projeto.split(",")
    if (projeto[0] == "Spring"):
        continue
    repo = g.get_repo(projeto[1])
    
    print("Rate limiting: " + str(g.rate_limiting[0]))

    if(g.rate_limiting[0] < repo.forks_count):
        tempo_para_dormir = int((g.rate_limiting_resettime - time.time()))
        print("Dormindo por : " + str(tempo_para_dormir / 60) + " minutos")
        time.sleep(tempo_para_dormir)
    for fork in repo.get_forks():
        try:
            comparacao = repo.compare("master",fork.owner.login+":master")
            with open("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ4/extraindo_forks_behind_ahead_commitDeMerge/forks.csv", "a") as saida:
                saida.write(projeto[0]+","+repo.full_name + ","+ fork.full_name +","+ comparacao.merge_base_commit.sha +","+ str(comparacao.behind_by) +","+ str(comparacao.ahead_by)+"\n")
            print(projeto[0]+","+repo.full_name + ","+ fork.full_name +","+ comparacao.merge_base_commit.sha +","+ str(comparacao.behind_by) +","+ str(comparacao.ahead_by))
        except:
            continue

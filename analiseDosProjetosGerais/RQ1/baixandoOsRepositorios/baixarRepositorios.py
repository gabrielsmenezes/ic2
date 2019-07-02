from git import Repo
repositorios = list()
with open ("/home/gabriel/Documentos/ic2/selecaoDosProjetosAleatoriamente/projetosAleatorios.csv") as projetos:
    for projeto in projetos:
        projeto = projeto.replace("\n", "").split(",")
        repositorio = {
            "framework": projeto[0],
            "nome": projeto[1]
        }
        repositorios.append(repositorio)
for repositorio in repositorios:
    git_url = "https://github.com/" + repositorio["nome"] + ".git"
    repo_dir = "/home/gabriel/Documentos/ic2/repositorios/"
    print("Baixando %s" % (repositorio["nome"]))
    Repo.clone_from(git_url, repo_dir+repositorio["nome"])
    print("%s baixado com sucesso" % (repositorio["nome"]))
    print(repositorio['nome'])
forks_ahead = list()
with open("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ4/extraindo_forks_behind_ahead_commitDeMerge/forks.csv") as entrada:
    for linha in entrada:
        linha1 = linha.split(",")
        if ("framework" == linha1[0]):
            continue
        fork = {
            "framework":linha1[0],
            "projeto":linha1[1],
            "fork":linha1[2],
            "base_commit":linha1[3],
            "behind_by":linha1[4],
            "ahead_by":linha1[5]
        }
        if (int(fork["ahead_by"]) > 0):
            forks_ahead.append(fork)
            print(linha.replace("\n",""))
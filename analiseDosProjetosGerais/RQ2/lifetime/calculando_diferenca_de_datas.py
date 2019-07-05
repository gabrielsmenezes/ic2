from datetime import datetime
from datetime import timezone
from datetime import timedelta

print("framework,projeto,data_do_commit,hoje,diferenca")

hoje = datetime.today()

with open("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ2/lifetime/initial_commit_date.csv") as projetos:
    for projeto in projetos:

        projeto = projeto.replace("\n", "")
        projeto = projeto.split(",")
        data = projeto[2].split(" ")
        date = data[0]
        hora = data[1].split(":")[0]
        minuto = data[1].split(":")[1]
        segundo = data[1].split(":")[2]
        fuso = data[2]
        projeto = {
            "framework": projeto[0],
            "nome_completo": projeto[1],
            "data_do_commit": datetime(year=int(date.split("-")[0]), month=int(date.split("-")[1]), day=int(date.split("-")[2]), hour=int(hora), minute=int(minuto), second=int(segundo))
        }

        diferenca = hoje - projeto["data_do_commit"]

        print(projeto["framework"]+","+projeto["nome_completo"]+","+str(projeto["data_do_commit"])+","+str(hoje)+","+str(diferenca.days))
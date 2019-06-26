import random

projetos_android = list()
projetos_spring = list()
projetos = list()
numero_gerado = -1
numero_total_de_projetos_android = 2918
numero_total_de_projetos_spring = 349


while(len(projetos_android) < 176):
    numero_gerado = random.randrange(1, numero_total_de_projetos_android)
    while (numero_gerado in projetos_android):
        numero_gerado = random.randrange(1, numero_total_de_projetos_android)
    projetos_android.append(numero_gerado)

while(len(projetos_spring) < 57):
    numero_gerado = random.randrange(numero_total_de_projetos_android+1, numero_total_de_projetos_android+numero_total_de_projetos_spring)
    while (numero_gerado in projetos_spring):
        numero_gerado = random.randrange(numero_total_de_projetos_android+1, numero_total_de_projetos_android+numero_total_de_projetos_spring)
    projetos_spring.append(numero_gerado)



with open ('/home/gabriel/Documentos/ic2/filtrarApenasAndroidSpring/listaDeProjetos.csv') as arquivo:
    for linha in arquivo:
        projetos.append(linha)

with open ('/home/gabriel/Documentos/ic2/selecaoDosProjetosAleatoriamente/projetosAleatorios.csv', 'a') as arquivo_de_saida:
    for projeto in projetos_android:
        arquivo_de_saida.write(projetos[projeto])
    
    for projeto in projetos_spring:
        arquivo_de_saida.write(projetos[projeto])
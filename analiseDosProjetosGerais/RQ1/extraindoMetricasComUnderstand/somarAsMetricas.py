repositorios = list()

with open('/home/gabriel/Documentos/ic2/selecaoDosProjetosAleatoriamente/projetosAleatorios.csv') as arquivos_de_entrada:
    for linha in arquivos_de_entrada:
        linha = linha.replace('\n', '').split(',')
        repositorio = {
            "framework": linha[0],
            "nome_do_dono": linha[1].split("/")[0],
            "nome_do_projeto": linha[1].split("/")[1]
        }
        repositorios.append(repositorio)


print('framework,projeto,AvgCyclomatic,AvgCyclomaticModified,AvgCyclomaticStrict,AvgEssential,AvgLine,AvgLineBlank,AvgLineCode,AvgLineComment,CountClassBase,CountClassCoupled,CountClassCoupledModified,CountClassDerived,CountDeclClass,CountDeclClassMethod,CountDeclClassVariable,CountDeclExecutableUnit,CountDeclFile,CountDeclFunction,CountDeclInstanceMethod,CountDeclInstanceVariable,CountDeclMethod,CountDeclMethodAll,CountDeclMethodDefault,CountDeclMethodPrivate,CountDeclMethodProtected,CountDeclMethodPublic,CountInput,CountLine,CountLineBlank,CountLineCode,CountLineCodeDecl,CountLineCodeExe,CountLineComment,CountOutput,CountPath,CountPathLog,CountSemicolon,CountStmt,CountStmtDecl,CountStmtExe,Cyclomatic,CyclomaticModified,CyclomaticStrict,Essential,Knots,MaxCyclomatic,MaxCyclomaticModified,MaxCyclomaticStrict,MaxEssential,MaxEssentialKnots,MaxInheritanceTree,MaxNesting,MinEssentialKnots,PercentLackOfCohesion,PercentLackOfCohesionModified,RatioCommentToCode,SumCyclomatic,SumCyclomaticModified,SumCyclomaticStrict,SumEssential,?,numberOfJavaFiles')
for repositorio in repositorios:
    metricas = [0] * 63
    with open('/home/gabriel/Documentos/ic2/extraindoMetricasComUnderstand/metricas/'+repositorio['nome_do_projeto']+'.csv') as arquivo_de_metricas:
        numero_de_java_file = 0
        for linha in arquivo_de_metricas:
            linha = linha.replace('\n', '').split(',')
            if("File" == linha[0]):
                numero_de_java_file += 1
                for i in range(2, len(linha)):
                    linha[i] = 0 if linha[i] == '' else int(linha[i])
                    metricas[i] += linha[i]
                metricas[0] = repositorio['framework']
                metricas[1] = repositorio['nome_do_dono']+'/'+repositorio['nome_do_projeto']
        for metrica in metricas:
            print(str(metrica) + ',', end='')
        print(str(numero_de_java_file))
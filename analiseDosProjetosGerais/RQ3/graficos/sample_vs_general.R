library(effsize)
library(ggplot2)
library(devtools)
library(easyGgplot2)
library(forcats)

general_android=read.csv("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ3/general/android_sem_divisao.csv", sep=",",header=T)

general_spring=read.csv("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ3/general/spring_sem_divisao.csv", sep=",",header=T)

samples_android=read.csv("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ3/samples/android_sem_divisao.csv", sep=",",header=T)

samples_spring=read.csv("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ3/samples/spring_sem_divisao.csv", sep=",",header=T)



################ Java files

#### ANDROID SAMPLE VS ANDROID GENERAL

wilcox.test(samples_android$numberofFilesJava, general_android$numberOfJavaFiles)

cliff.delta(samples_android$numberofFilesJava, general_android$numberOfJavaFiles)

#### SPRING SAMPLE VS SPRING GENERAL

wilcox.test(samples_spring$numberofFiles, general_spring$numberOfJavaFiles)

cliff.delta(samples_spring$numberofFiles, general_spring$numberOfJavaFiles)









################3Lines of Code = CountLineCode


#### ANDROID SAMPLE VS ANDROID GENERAL

wilcox.test(samples_android$CountLineCode, general_android$CountLineCode)

cliff.delta(samples_android$CountLineCode, general_android$CountLineCode)

#### SPRING SAMPLE VS SPRING GENERAL

wilcox.test(samples_spring$CountLineCode, general_spring$CountLineCode)

cliff.delta(samples_spring$CountLineCode, general_spring$CountLineCode)




############## Relative Commented Lines - comment_rel - RCL

#### ANDROID SAMPLE VS ANDROID GENERAL

wilcox.test((samples_android$CountLineComment/samples_android$CountLine), (general_android$CountLineComment/general_android$CountLine))

cliff.delta((samples_android$CountLineComment/samples_android$CountLine), (general_android$CountLineComment/general_android$CountLine))

#### SPRING SAMPLE VS SPRING GENERAL

wilcox.test((samples_spring$CountLineComment/samples_spring$CountLine), (general_spring$CountLineComment/general_spring$CountLine))

cliff.delta((samples_spring$CountLineComment/samples_spring$CountLine), (general_spring$CountLineComment/general_spring$CountLine))











################### Complexity


#### ANDROID SAMPLE VS ANDROID GENERAL

wilcox.test(samples_android$SumCyclomaticStrict, general_android$SumCyclomaticStrict)

cliff.delta(samples_android$SumCyclomaticStrict, general_android$SumCyclomaticStrict)

#### SPRING SAMPLE VS SPRING GENERAL

wilcox.test(samples_spring$SumCyclomaticStrict, general_spring$SumCyclomaticStrict)

cliff.delta(samples_spring$SumCyclomaticStrict, general_spring$SumCyclomaticStrict)
















#################### Lifetime

general_android=read.csv("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ3/general/android_lifetime.csv", sep=",",header=T)

general_spring=read.csv("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ3/general/spring_lifetime.csv", sep=",",header=T)


#### ANDROID SAMPLE VS ANDROID GENERAL

wilcox.test(samples_android$Lifetime, general_android$Lifetime)

cliff.delta(samples_android$Lifetime, general_android$Lifetime)

#### SPRING SAMPLE VS SPRING GENERAL

wilcox.test(samples_spring$Lifetime, general_spring$Lifetime)

cliff.delta(samples_spring$Lifetime, general_spring$Lifetime)







########################### Ratio Lifetime/commits - lifetime_commits



#### ANDROID SAMPLE VS ANDROID GENERAL

wilcox.test(samples_android$LifetimePerCommit, (general_android$Lifetime/general_android$commits))

cliff.delta(samples_android$LifetimePerCommit, (general_android$Lifetime/general_android$commits))

#### SPRING SAMPLE VS SPRING GENERAL

wilcox.test(samples_spring$LifetimePerCommit, (general_spring$Lifetime/general_spring$commits))

cliff.delta(samples_spring$LifetimePerCommit, (general_spring$Lifetime/general_spring$commits))

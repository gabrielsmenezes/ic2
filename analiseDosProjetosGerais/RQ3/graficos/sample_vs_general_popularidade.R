library(effsize)
library(ggplot2)
library(devtools)
library(easyGgplot2)
library(forcats)

general_androidtop=read.csv("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ3/general/android_top.csv", sep=",",header=T)
general_androidbottom=read.csv("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ3/general/android_bottom.csv", sep=",",header=T)

general_springtop=read.csv("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ3/general/spring_top.csv", sep=",",header=T)
general_springbottom=read.csv("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ3/general/spring_bottom.csv", sep=",",header=T)

samples_androidtop=read.csv("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ3/samples/Metrics-Android-TOP.csv", sep=",",header=T)
samples_androidbottom=read.csv("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ3/samples/Metrics-Android-BOTTOM.csv", sep=",",header=T)

samples_springtop=read.csv("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ3/samples/Metrics-Spring-TOP.csv", sep=",",header=T)
samples_springbottom=read.csv("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ3/samples/Metrics-Spring-BOTTOM.csv", sep=",",header=T)

################ Java files

#### ANDROID SAMPLE TOP VS ANDROID GENERAL TOP

wilcox.test(samples_androidtop$numberofFilesJava, general_androidtop$numberOfJavaFiles)

cliff.delta(samples_androidtop$numberofFilesJava, general_androidtop$numberOfJavaFiles)

#### SPRING SAMPLE TOP VS SPRING GENERAL TOP

wilcox.test(samples_springtop$numberofFiles, general_springtop$numberOfJavaFiles)

cliff.delta(samples_springtop$numberofFiles, general_springtop$numberOfJavaFiles)

#### ANDROID SAMPLE BOTTOM VS ANDROID GENERAL BOTTOM

wilcox.test(samples_androidbottom$numberofFilesJava, general_androidbottom$numberOfJavaFiles)

cliff.delta(samples_androidbottom$numberofFilesJava, general_androidbottom$numberOfJavaFiles)

#### SPRING SAMPLE BOTTOM VS SPRING GENERAL BOTTOM

wilcox.test(samples_springbottom$numberofFiles, general_springbottom$numberOfJavaFiles)

cliff.delta(samples_springbottom$numberofFiles, general_springbottom$numberOfJavaFiles)










################3Lines of Code = CountLineCode


#### ANDROID SAMPLE TOP VS ANDROID GENERAL TOP

wilcox.test(samples_androidtop$CountLineCode, general_androidtop$CountLineCode)

cliff.delta(samples_androidtop$CountLineCode, general_androidtop$CountLineCode)

#### SPRING SAMPLE TOP VS SPRING GENERAL TOP

wilcox.test(samples_springtop$CountLineCode, general_springtop$CountLineCode)

cliff.delta(samples_springtop$CountLineCode, general_springtop$CountLineCode)

#### ANDROID SAMPLE BOTTOM VS ANDROID GENERAL BOTTOM

wilcox.test(samples_androidbottom$CountLineCode, general_androidbottom$CountLineCode)

cliff.delta(samples_androidbottom$CountLineCode, general_androidbottom$CountLineCode)

#### SPRING SAMPLE BOTTOM VS SPRING GENERAL BOTTOM

wilcox.test(samples_springbottom$CountLineCode, general_springbottom$CountLineCode)

cliff.delta(samples_springbottom$CountLineCode, general_springbottom$CountLineCode)




############## Relative Commented Lines - comment_rel - RCL

#### ANDROID SAMPLE TOP VS ANDROID GENERAL TOP

wilcox.test((samples_androidtop$CountLineComment/samples_androidtop$CountLine), (general_androidtop$CountLineComment/general_androidtop$CountLine))

cliff.delta((samples_androidtop$CountLineComment/samples_androidtop$CountLine), (general_androidtop$CountLineComment/general_androidtop$CountLine))

#### SPRING SAMPLE TOP VS SPRING GENERAL TOP

wilcox.test((samples_springtop$CountLineComment/samples_springtop$CountLine), (general_springtop$CountLineComment/general_springtop$CountLine))

cliff.delta((samples_springtop$CountLineComment/samples_springtop$CountLine), (general_springtop$CountLineComment/general_springtop$CountLine))

#### ANDROID SAMPLE BOTTOM VS ANDROID GENERAL BOTTOM

wilcox.test((samples_androidbottom$CountLineComment/samples_androidbottom$CountLine), (general_androidbottom$CountLineComment/general_androidbottom$CountLine))

cliff.delta((samples_androidbottom$CountLineComment/samples_androidbottom$CountLine), (general_androidbottom$CountLineComment/general_androidbottom$CountLine))

#### SPRING SAMPLE BOTTOM VS SPRING GENERAL BOTTOM

wilcox.test((samples_springbottom$CountLineComment/samples_springbottom$CountLine), (general_springbottom$CountLineComment/general_springbottom$CountLine) )

cliff.delta((samples_springbottom$CountLineComment/samples_springbottom$CountLine), (general_springbottom$CountLineComment/general_springbottom$CountLine) )











################### Complexity


#### ANDROID SAMPLE TOP VS ANDROID GENERAL TOP

wilcox.test(samples_androidtop$SumCyclomaticStrict, general_androidtop$SumCyclomaticStrict)

cliff.delta(samples_androidtop$SumCyclomaticStrict, general_androidtop$SumCyclomaticStrict)

#### SPRING SAMPLE TOP VS SPRING GENERAL TOP

wilcox.test(samples_springtop$SumCyclomaticStrict, general_springtop$SumCyclomaticStrict)

cliff.delta(samples_springtop$SumCyclomaticStrict, general_springtop$SumCyclomaticStrict)

#### ANDROID SAMPLE BOTTOM VS ANDROID GENERAL BOTTOM

wilcox.test(samples_androidbottom$SumCyclomaticStrict, general_androidbottom$SumCyclomaticStrict)

cliff.delta(samples_androidbottom$SumCyclomaticStrict, general_androidbottom$SumCyclomaticStrict)

#### SPRING SAMPLE BOTTOM VS SPRING GENERAL BOTTOM

wilcox.test(samples_springbottom$SumCyclomaticStrict, general_springbottom$SumCyclomaticStrict)

cliff.delta(samples_springbottom$SumCyclomaticStrict, general_springbottom$SumCyclomaticStrict)















#################### Lifetime

#### ANDROID SAMPLE TOP VS ANDROID GENERAL TOP

wilcox.test(samples_androidtop$Lifetime, general_androidtop$Lifetime)

cliff.delta(samples_androidtop$Lifetime, general_androidtop$Lifetime)

#### SPRING SAMPLE TOP VS SPRING GENERAL TOP

wilcox.test(samples_springtop$Lifetime, general_springtop$Lifetime)

cliff.delta(samples_springtop$Lifetime, general_springtop$Lifetime)

#### ANDROID SAMPLE BOTTOM VS ANDROID GENERAL BOTTOM

wilcox.test(samples_androidbottom$Lifetime, general_androidbottom$Lifetime)

cliff.delta(samples_androidbottom$Lifetime, general_androidbottom$Lifetime)

#### SPRING SAMPLE BOTTOM VS SPRING GENERAL BOTTOM

wilcox.test(samples_springbottom$Lifetime, general_springbottom$Lifetime)

cliff.delta(samples_springbottom$Lifetime, general_springbottom$Lifetime)






########################### Ratio Lifetime/commits - lifetime_commits



#### ANDROID SAMPLE TOP VS ANDROID GENERAL TOP

wilcox.test(samples_androidtop$LifetimePerCommit, (general_androidtop$Lifetime/general_androidtop$commits))

cliff.delta(samples_androidtop$LifetimePerCommit, (general_androidtop$Lifetime/general_androidtop$commits))

#### SPRING SAMPLE TOP VS SPRING GENERAL TOP

wilcox.test(samples_springtop$LifetimePerCommit, (general_springtop$Lifetime/general_springtop$commits))

cliff.delta(samples_springtop$LifetimePerCommit, (general_springtop$Lifetime/general_springtop$commits))

#### ANDROID SAMPLE BOTTOM VS ANDROID GENERAL BOTTOM

wilcox.test(samples_androidbottom$LifetimePerCommit, (general_androidbottom$Lifetime/general_androidbottom$commits))

cliff.delta(samples_androidbottom$LifetimePerCommit, (general_androidbottom$Lifetime/general_androidbottom$commits))

#### SPRING SAMPLE BOTTOM VS SPRING GENERAL BOTTOM

wilcox.test(samples_springbottom$LifetimePerCommit, (general_springbottom$Lifetime/general_springbottom$commits))

cliff.delta(samples_springbottom$LifetimePerCommit, (general_springbottom$Lifetime/general_springbottom$commits))
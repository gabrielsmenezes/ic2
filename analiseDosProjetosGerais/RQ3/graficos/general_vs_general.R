library(effsize)


setwd("C:\\Users\\Gabriel\\Documents\\gabrielsmenezes\\ic2\\analiseDosProjetosGerais\\RQ3\\general")

androidtop=read.csv("android_top.csv", sep=",",header=T)
androidbottom=read.csv("android_bottom.csv", sep=",",header=T)

springtop=read.csv("spring_top.csv", sep=",",header=T)
springbottom=read.csv("spring_bottom.csv", sep=",",header=T)

################ Java files
box=boxplot(androidtop$numberOfJavaFiles,androidbottom$numberOfJavaFiles, springtop$numberOfJavaFiles, springbottom$numberOfJavaFiles, log="y", ylab="Number of Files (log scale)", outline=F, main="Number of Java Files", names=c("A-Top","A-Bottom","S-Top","S-Bottom"))
box

wilcox.test(androidtop$numberOfJavaFiles, androidbottom$numberOfJavaFiles)

# nao precisa pois p-value eh maior que 0.05 cliff.delta(androidtop$numberOfJavaFiles, androidbottom$numberOfJavaFiles)

wilcox.test(springtop$numberOfJavaFiles, springbottom$numberOfJavaFiles)

cliff.delta(springtop$numberOfJavaFiles, springbottom$numberOfJavaFiles)


################3Lines of Code = CountLineCode
box=boxplot(androidtop$CountLineCode,androidbottom$CountLineCode, springtop$CountLineCode, springbottom$CountLineCode, log="y",ylab="Lines of code (log scale)", outline=T, main="Java - Lines of code (LOC)", names=c("A-Top","A-Bottom","S-Top","S-Bottom"))
box

wilcox.test(androidtop$CountLineCode, androidbottom$CountLineCode)
# nao necessario cliff.delta(androidtop$CountLineCode, androidbottom$CountLineCode)

wilcox.test(springtop$CountLineCode, springbottom$CountLineCode)
cliff.delta(springtop$CountLineCode, springbottom$CountLineCode)



############## Relative Commented Lines - comment_rel - RCL
box=boxplot((androidtop$CountLineComment/androidtop$CountLine),(androidbottom$CountLineComment/androidbottom$CountLine), (springtop$CountLineComment/springtop$CountLine), (springbottom$CountLineComment/springbottom$CountLine), ylab="Relative Commented Lines (%)", outline=T, main="Relative Commented Lines (RCL)", names=c("A-Top","A-Bottom","S-Top","S-Bottom"))
box

wilcox.test((androidtop$CountLineComment/androidtop$CountLine), (androidbottom$CountLineComment/androidbottom$CountLine))
cliff.delta((androidtop$CountLineComment/androidtop$CountLine), (androidbottom$CountLineComment/androidbottom$CountLine))

wilcox.test((springtop$CountLineComment/springtop$CountLine), (springbottom$CountLineComment/springbottom$CountLine))
#nao precisa cliff.delta(springtop$RelativeLineComment, springbottom$RelativeLineComment)


################### Complexity

box=boxplot(androidtop$SumCyclomaticStrict,androidbottom$SumCyclomaticStrict, springtop$SumCyclomaticStrict, springbottom$SumCyclomaticStrict, ylab="Nº of Decisions Points", log = "y", outline=T, main="Sum Cyclomatic Complexity", names=c("A-Top","A-Bottom","S-Top","S-Bottom"))
box

wilcox.test(androidtop$SumCyclomaticStrict, androidbottom$SumCyclomaticStrict)
#nao precisa cliff.delta(androidtop$SumCyclomaticStrict, androidbottom$SumCyclomaticStrict)

wilcox.test(springtop$SumCyclomaticStrict, springbottom$SumCyclomaticStrict)
cliff.delta(springtop$SumCyclomaticStrict, springbottom$SumCyclomaticStrict)



#################### Lifetime
box=boxplot(androidtop$Lifetime,androidbottom$Lifetime, springtop$Lifetime, springbottom$Lifetime, ylab="Lifetime (in days)", outline=T, main="Lifetime", names=c("A-Top","A-Bottom","S-Top","S-Bottom"))
box

wilcox.test(androidtop$Lifetime, androidbottom$Lifetime)
# nao precisa cliff.delta(androidtop$Lifetime, androidbottom$Lifetime)

wilcox.test(springtop$Lifetime, springbottom$Lifetime)
# nao precis cliff.delta(springtop$Lifetime, springbottom$Lifetime)


########################### Ratio Lifetime/commits - lifetime_commits
box=boxplot((androidtop$Lifetime/androidtop$commits),(androidbottom$Lifetime/androidbottom$commits), (springtop$Lifetime/springtop$commits), (springbottom$Lifetime/springbottom$commits), log="y", ylab="Ratio Lifetime/Commits (log scale)", outline=F, main="Ratio Lifetime/Commits", names=c("A-Top","A-Bottom","S-Top","S-Bottom"))
box

wilcox.test((androidtop$Lifetime/androidtop$commits),(androidbottom$Lifetime/androidbottom$commits))
cliff.delta((androidtop$Lifetime/androidtop$commits),(androidbottom$Lifetime/androidbottom$commits))

wilcox.test((springtop$Lifetime/springtop$commits), (springbottom$Lifetime/springbottom$commits))
cliff.delta((springtop$Lifetime/springtop$commits), (springbottom$Lifetime/springbottom$commits))

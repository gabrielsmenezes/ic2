library(effsize)
library(ggplot2)
library(forcats)

all=read.csv("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ2/lifetime/diferencas.csv", sep=",",header=T)
#----------  RQ2

p1 <- ggplot(all, aes(factor(all$framework,levels = c("Android","Spring")), all$Lifetime))
p1 <- p1 + geom_violin(width=1, trim=TRUE, fill="#87CEFA") + scale_y_log10()
p1 <- p1 + geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Lifetime") + xlab("General Projects") + ylab("Nº of day (log scale)")
p1 <- p1 + annotate("text", x = 1, y = 1500, label = "1283", size = 6) + annotate("text", x = 2, y = 1200, label = "862", size = 6) 
p1 + theme(plot.title=element_text(size=20, face = "bold") ,axis.title=element_text(size=18),axis.text=element_text(size=18))
ggsave("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ2/graficos/lifetime.pdf", width = 4.5, height = 4.5)


######Lifetime por commit

p1 <- ggplot(all, aes(factor(all$framework,levels = c("Android","Spring")), all$Lifetime/all$commits))
p1 <- p1 + geom_violin(width=1, trim=TRUE, fill="#87CEFA") + scale_y_log10()
p1 <- p1 + geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Lifetime per commit") + xlab("General Projects") + ylab("Frequency of commits (log scale)")
p1 <- p1 + annotate("text", x = 1.0, y = 40, label = "23", size = 6) + annotate("text", x = 2.0, y = 9, label = "6", size = 6) 
p1 + theme(plot.title=element_text(size=20,face="bold") ,axis.title=element_text(size=18),axis.text=element_text(size=18))
ggsave("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ2/graficos/lifetime_commits.pdf", width = 4.5, height = 4.5)

###### Versoes atual do framework Android

subtipos = rep(c("TargetSdk", "MinSdk"), each=13)

apiLevel <- rep( c("11","14","15","16","19","21","22","23","24","25","26","27","28"), 2 )



values <-c(12,70,35,24,17,83,0,30,0,0,4,1,0,
           0,1,0,0,16,13,23,58,21,19,124,18,35)


df2 <- data.frame(supp=subtipos,dose=apiLevel,len=values)
head(df2)
p <- ggplot(data=df2, aes(x=dose, y=len, fill=supp)) +
  geom_bar(stat="identity", position=position_dodge()) +
  labs(title="Android Samples", x="API Level", y = "Number of Projects / Subprojects") +
  scale_fill_manual("", values = c("MinSdk" = "#87CEFA", "TargetSdk" = "#4682b4"))+
  theme(plot.title=element_text(size=20, face = "bold"), axis.title=element_text(size=18),axis.text=element_text(size=18), legend.position = c(0.2, 0.80))

p

ggsave("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ2/graficos/androidAPILevel.pdf", width = 4.5, height = 4.5) 


######## Versoes do spring
springVersion <- c("1.X.X", "2.0.X", "2.1.X")

values <-c(90,16,32)

df2 <- data.frame(dose=springVersion,
                  len=values)
head(df2)

p <- ggplot(data=df2, aes(x=dose, y=len)) +
  geom_bar(stat="identity", position=position_dodge(), fill = "#87CEFA") +
  labs(title="Spring Samples", x="Springboot Version", y = "Number of Projects / Subprojects") +
  theme(plot.title=element_text(size=20, face = "bold"), axis.title=element_text(size=18),axis.text=element_text(size=18))
p

ggsave("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ2/graficos/springVersions.pdf", width = 4.5, height = 4.5)




################

p1 <- ggplot(all, aes(factor(all$ecosystem,levels = c("Android","Spring")), all$Commit))
p1 <- p1 + geom_violin(width=1, trim=TRUE, fill="#87CEFA") + scale_y_log10()
p1 <- p1 + geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Commits") + xlab("Code Samples") + ylab("Nº of commits (log scale)")
#[3,]   24  117
p1 <- p1 + annotate("text", x = 1, y = 18, label = "24", size = 6) + annotate("text", x = 2, y = 145, label = "117", size = 6) 
p1 + theme(plot.title=element_text(size=20, face = "bold") ,axis.title=element_text(size=18),axis.text=element_text(size=18))
ggsave("/home/facom/Documents/GIT/Samples/figuras/commits.pdf", width = 4.5, height = 4.5)



p1 <- ggplot(all, aes(factor(all$ecosystem,levels = c("Android","Spring")), all$Contributor))
p1 <- p1 + geom_violin(width=1, trim=TRUE, fill="#87CEFA") + scale_y_log10()
p1 <- p1 + geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Contributors") + xlab("Code Samples") + ylab("Nº of contributors (log scale)")
#[3,]    1    9
p1 <- p1 + annotate("text", x = 1, y = 1.2, label = "1", size = 6) + annotate("text", x = 2, y = 10, label = "9", size = 6) 
p1 + theme(plot.title=element_text(size=20,face="bold") ,axis.title=element_text(size=18),axis.text=element_text(size=18))
ggsave("/home/facom/Documents/GIT/Samples/figuras/contributors.pdf", width = 4.5, height = 4.5)

p1 <- ggplot(all, aes(factor(all$ecosystem,levels = c("Android","Spring")), all$LifetimePerCont))
p1 <- p1 + geom_violin(width=1, trim=TRUE, fill="#87CEFA") + scale_y_log10()
p1 <- p1 + geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Lifetime per contributor") + xlab("Code Samples") + ylab("Frequency of contributors (log scale)")
#[3,] 1027  201
p1 <- p1 + annotate("text", x = 1, y = 1170, label = "1027", size = 6) + annotate("text", x = 2, y = 225, label = "201", size = 6) 
p1 + theme(plot.title=element_text(size=20,face="bold") ,axis.title=element_text(size=18),axis.text=element_text(size=18))
ggsave("/home/facom/Documents/GIT/Samples/figuras/lifetime_contributors.pdf", width = 4.5, height = 4.5)

p1 <- ggplot(all, aes(factor(all$ecosystem,levels = c("Android","Spring")), all$BC+1))
p1 <- p1 + geom_violin(width=1, trim=TRUE, fill="#87CEFA") + scale_y_log10()
p1 <- p1 + geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Breaking Changes") + xlab("Code Samples") + ylab("Breaking Changes (log scale)")
#[3,]    1  180
p1 <- p1 + annotate("text", x = 1, y = 1.5, label = "1", size = 6) + annotate("text", x = 2, y = 260, label = "180", size = 6)
p1 + theme(plot.title=element_text(size=20,face="bold") ,axis.title=element_text(size=18),axis.text=element_text(size=18))
ggsave("/home/facom/Documents/GIT/Samples/figuras/BC.pdf", width = 4.5, height = 4.5)

p1 <- ggplot(all, aes(factor(all$ecosystem,levels = c("Android","Spring")), all$relativeBC))
p1 <- p1 + geom_violin(width=1, trim=TRUE, fill="#87CEFA") #+ scale_y_log10()
p1 <- p1 + geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Relative Breaking Changes") + xlab("Code Samples") + ylab("Percent of BC (log scale)")
#[3,]  0.00   40
p1 <- p1 + annotate("text", x = 1, y = 4, label = "0", size = 6) + annotate("text", x = 2, y = 44, label = "40", size = 6)
p1 + theme(plot.title=element_text(size=20,face="bold") ,axis.title=element_text(size=18),axis.text=element_text(size=18))
ggsave("/home/facom/Documents/GIT/Samples/figuras/relativeBC.pdf", width = 4.5, height = 4.5)

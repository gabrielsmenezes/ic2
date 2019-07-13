library(effsize)
library(ggplot2)
library(forcats)
require(scales)

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


####### Delay to update



all=read.csv("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ2/delay/delay.csv", sep=",",header=T)

p1 <- ggplot(all, aes(factor(all$framework, levels = c("Android", "Spring")), all$delay+0.1)) + 
  geom_violin(width=1, trim=TRUE,fill="#87CEFA") +
  scale_y_log10(labels = comma) +
  geom_boxplot(width=0.6,alpha=0.6) + ggtitle("Samples delay to update") + xlab("General Projects") + ylab("Delay in days (log scale)") +
  annotate("text", x = 1, y = 100, label = "138", size = 6) + annotate("text", x = 2, y = 7, label = "9", size = 6) +
  theme(plot.title=element_text(size=16, face = "bold"), axis.title=element_text(size=18),axis.text=element_text(size=18))

#mediana do android 138
#mediana do spring 9

p1

ggsave("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ2/graficos/delay_samples2.pdf", width = 4.5, height = 4.5)

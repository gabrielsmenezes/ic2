library(effsize)
library(ggplot2)
library(devtools)
library(easyGgplot2)
library(forcats)


##############Number of forks

all=read.csv("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ1/obtendoOsMetadadosDosRepositorios/listaDeMetadadosDosProjetos.csv", sep=",",header=T)

p1 <- ggplot(all, aes(factor(all$framework, levels = c("Android","Spring")), all$forks)) + 
  geom_violin(width=1, trim=TRUE,fill="#87CEFA") +
  scale_y_log10() +
  geom_boxplot(width=0.6,alpha=0.6) + ggtitle("Number of forks") + xlab("General Projects") + ylab("Number of forks (log scale)") + 
  annotate("text", x = 1, y = 150, label = "102", size = 6) + annotate("text", x = 2, y = 250, label = "176", size = 6) +
  theme(plot.title=element_text(size=16, face = "bold"), axis.title=element_text(size=18),axis.text=element_text(size=18))

  #mediana do android 102 
  #mediana do spring 176

p1

ggsave("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ4/Graficos/forks.pdf", width = 4.5, height = 4.5)



##########number of imports
all=read.csv("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ4/numeroDeImports/imports.csv", sep=",",header=T)


p1 <- ggplot(all, aes(factor(all$framework,levels = c("Android","Spring")), all$imports)) + 
  geom_violin(width=1, trim=TRUE, fill="#87CEFA") + 
  scale_y_log10() +
  geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Relative distinct imports") + xlab("General Projects") + ylab("Imports") + 
  annotate("text", x = 1, y = 2.8, label = "1.85", size = 6) + 
  annotate("text", x = 2, y = 0.1, label = "0.08", size = 6) +
  theme(plot.title=element_text(size=20,face="bold") ,axis.title=element_text(size=18),axis.text=element_text(size=18))

p1

ggsave("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ4/graficos/totalImportsDistinct.pdf", width = 4.5, height = 4.5)



####Mantenedores

all = read.csv("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ4/mantenedores/juntos.csv",sep=",",header=T)

p1 <- ggplot(all, aes(factor(all$framework,levels = c("Android","Spring")), (all$contribuidores_comum/all$contribuidores_do_projeto) * 100)) + 
  geom_violin(width=1, trim=TRUE, fill="#87CEFA") + 
  ylim(0,30)+
  geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Relative Framework Contributors\nInside General Project") + xlab("General Projects") + ylab("Common Contributors") + 
  annotate("text", x = 2, y = 1, label = "0", size = 6) + annotate("text", x = 1, y = 1, label = "0", size = 6) + 
  theme(plot.title=element_text(size=16,face="bold") ,axis.title=element_text(size=16),axis.text=element_text(size=16))

p1

ggsave("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ4/Graficos/FrameworkInCodeSample.pdf", width = 4.5, height = 4.5)


##############forks ahead / forks

all=read.csv("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ4/extraindoTotalDeForks_ForksAhead/forks.csv", sep=",",header=T)

p1 <- ggplot(all, aes(factor(all$framework,levels = c("Android","Spring")), (all$forks_ahead/all$forks)*100)) + 
  geom_violin(width=1, trim=TRUE, fill="#87CEFA") + 
  #scale_y_log10() +
  geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Relative Ahead Forks") + xlab("General Projects") + ylab("Percent of Ahead Forks") + 
  annotate("text", x = 1, y = 3, label = "2", size = 6) + 
  annotate("text", x = 2, y = 4, label = "3", size = 6) +
  theme(plot.title=element_text(size=20,face="bold") ,axis.title=element_text(size=18),axis.text=element_text(size=18))

p1

ggsave("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ4/Graficos/razao.pdf", width = 4.5, height = 4.5)



########### Relative projetos ahead by number of commits
subtipos = rep(c("Android", "Spring"), each=4)
apiLevel <- rep( c("1", "2-3", "4-10", "> 10"), 2 )
values <-c(41,25,16,16,47,29,13,8)
df2 <- data.frame(supp=subtipos,dose=apiLevel,len=values)
head(df2)
p <- ggplot(data=df2, aes(x=dose, y=len, fill=supp)) +
  geom_bar(stat="identity", position=position_dodge()) +
  labs(title="Relative projects ahead by commits", x="Number of commits", y = "Percent of projects") +
  scale_fill_manual("", values = c("Android" = "#87CEFA", "Spring" = "#4682b4"))+
  geom_text(aes(label=len), vjust=0, color="black",position = position_dodge(0.9), size=5)+
  theme(plot.title=element_text(size=16, face = "bold"), axis.title=element_text(size=16),axis.text=element_text(size=16), legend.position = c(0.87, 0.80))
p
ggsave("/home/gabriel/Documentos/ic2/analiseDosProjetosGerais/RQ4/Graficos/relative_projects_by_commits2.pdf", width = 4.5, height = 4.5) 

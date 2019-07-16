library(effsize)
library(ggplot2)
library(devtools)
library(easyGgplot2)
library(forcats)

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

library(ggplot2)
library(scales)

all=read.csv("/home/gabriel/Documentos/ic2/obtendoOsMetadadosDosRepositorios/listaDeMetadadosDosProjetos.csv", sep=",",header=T)

#stars

p1 <- ggplot(all, aes(factor(all$framework,levels = c("Android", "Spring")), all$stargazers)) + 
  scale_y_log10() +
  geom_violin(width=1, trim=TRUE, fill="#87CEFA") + 
  geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Number of Stars") + xlab("General Projects") + ylab("Number of Stars (log scale)") + 
  annotate("text", x = 1, y = 500, label = "388.5", size = 8) + annotate("text", x = 2, y = 450, label = "346", size = 8) +
  theme(plot.title=element_text(size=24,face="bold") ,axis.title=element_text(size=20),axis.text=element_text(size=18))

p1

ggsave("projetos/metricasBasicas/stars.pdf", width = 4.5, height = 4.5)

#Commits


p1 <- ggplot(all, aes(factor(all$framework,levels = c("Android", "Spring")), all$commits)) + 
  scale_y_log10() +
  geom_violin(width=1, trim=TRUE, fill="#87CEFA") + 
  geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Number of Commits") + xlab("General Projects") + ylab("Number of Commits (log scale)") + 
  annotate("text", x = 1, y = 80, label = "52", size = 8) + annotate("text", x = 2, y = 200, label = "127", size = 8) +
  theme(plot.title=element_text(size=24,face="bold") ,axis.title=element_text(size=20),axis.text=element_text(size=18))

p1

ggsave("projetos/metricasBasicas/commits.pdf", width = 4.5, height = 4.5)


#Files

all=read.csv("/home/gabriel/Documentos/ic2/quantidadeDeCadaArquivo/quantidadeDeCadaArquivo.csv", sep=",",header=T)

p1 <- ggplot(all, aes(factor(all$framework,levels = c("Android", "Spring")), all$numberOfFiles)) + 
  scale_y_log10() +
  geom_violin(width=1, trim=TRUE, fill="#87CEFA") + 
  geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Number of Files") + xlab("General Projects") + ylab("Number of Files (log scale)") + 
  annotate("text", x = 1, y = 100, label = "77", size = 8) + annotate("text", x = 2, y = 300, label = "177.5", size = 8) +
  theme(plot.title=element_text(size=24,face="bold") ,axis.title=element_text(size=20),axis.text=element_text(size=18))

p1

ggsave("projetos/metricasBasicas/files.pdf", width = 4.5, height = 4.5)


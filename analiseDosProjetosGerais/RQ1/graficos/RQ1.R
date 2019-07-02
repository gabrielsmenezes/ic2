library(effsize)
library(ggplot2)
library(forcats)

all=read.csv("/home/gabriel/Documentos/ic2/extraindoMetricasComUnderstand/metricas.csv", sep=",",header=T)

# -------- Size

p1 <- ggplot(all, aes(factor(all$framework, levels = c("Android","Spring")), all$numberOfJavaFiles))
p1 <- p1 + geom_violin(width=1, trim=TRUE,fill="#87CEFA") + scale_y_log10()
p1 <- p1 + geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Number of files") + xlab("General Projects") + ylab("Number of files (log scale)")
p1 <- p1 + annotate("text", x = 1, y = 25, label = "19", size = 6) + annotate("text", x = 2, y = 130, label = "96", size = 6) 
p1 + theme(plot.title=element_text(size=20, face = "bold"), axis.title=element_text(size=18),axis.text=element_text(size=18))
ggsave("projetos/RQ1/numberOfJavaFiles.pdf", width = 4.5, height = 4.5)


#------ Lines of code per java file

p1 <- ggplot(all, aes(factor(all$framework,levels = c("Android","Spring")), all$CountLineCode/all$numberOfJavaFiles ))
p1 <- p1 + geom_violin(width=1, trim=TRUE, fill="#87CEFA") + scale_y_log10()
p1 <- p1 + geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Lines of code per file") + xlab("General Projects") + ylab("Lines of code (log scale)")
p1 <- p1 + annotate("text", x = 1, y = 70, label = "79", size = 6) + annotate("text", x = 2, y = 50, label = "43", size = 6) 
p1 + theme(plot.title=element_text(size=20, face = "bold") ,axis.title=element_text(size=18),axis.text=element_text(size=18))
ggsave("projetos/RQ1/RLOC_files.pdf", width = 4.5, height = 4.5)

# -------Relative commented lines per java file

p1 <- ggplot(all, aes(factor(all$framework,levels = c("Android","Spring")), (all$CountLineComment/all$CountLine) * 100))
p1 <- p1 + geom_violin(width=1, trim=TRUE, fill="#87CEFA") + scale_y_log10(limits = c(1, 50))
p1 <- p1 + geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Relative comment lines") + xlab("General Projects") + ylab("Percent of lines (log scale)")
p1 <- p1 + annotate("text", x = 1, y = 12, label = "13", size = 6) + annotate("text", x = 2, y = 14, label = "19", size = 6) 
p1 + theme(plot.title=element_text(size=20, face = "bold") ,axis.title=element_text(size=18),axis.text=element_text(size=18))
ggsave("projetos/RQ1/RCL.pdf", width = 4.5, height = 4.5)


# -------- Complexity

p1 <- ggplot(all, aes(factor(all$framework,levels = c("Android","Spring")), (all$SumCyclomaticStrict/all$CountDeclMethod) ))
p1 <- p1 + geom_violin(width=1, trim=TRUE, fill="#87CEFA") + scale_y_log10(limits=c(0.5, 3))
p1 <- p1 + geom_boxplot(width=0.7,alpha=0.7) + ggtitle("CC per method") + xlab("General Projects") + ylab("Nº of Decisions Points (log scale)")
p1 <- p1 + annotate("text", x = 1, y = 1.5, label = "1.62", size = 6) + annotate("text", x = 2, y = 1.41, label = "1.34", size = 6) 
p1 + theme(plot.title=element_text(size=20, face = "bold") ,axis.title=element_text(size=18),axis.text=element_text(size=18))
ggsave("projetos/RQ1/ACC.pdf", width = 4.5, height = 4.5)


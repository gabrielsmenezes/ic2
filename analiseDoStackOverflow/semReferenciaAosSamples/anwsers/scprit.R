library(ggplot2)
require(scales)

all=read.csv("data.csv", sep=",",header=T)


p1 <- ggplot(all, aes(factor(all$framework,levels = c("Android","Spring")), all$Score)) + 
  geom_violin(width=1, trim=TRUE, fill="#87CEFA") + 
  scale_y_log10() +
  geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Question score") + xlab("Code Samples") + ylab("Score (log scale)") + 
  annotate("text", x = 1, y = 3, label = "1", size = 6) + 
  annotate("text", x = 2, y = 3, label = "1", size = 6) +
  theme(plot.title=element_text(size=20,face="bold") ,axis.title=element_text(size=18),axis.text=element_text(size=18))

p1

ggsave("score.pdf", width = 4.5, height = 4.5)

p1 <- ggplot(all, aes(factor(all$framework,levels = c("Android","Spring")), all$CommentCount + 0.1)) + 
  geom_violin(width=1, trim=TRUE, fill="#87CEFA") + 
  scale_y_log10(labels = comma) +
  geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Number of Comments") + xlab("Code Samples") + ylab("Comments (log scale)") + 
  annotate("text", x = 1, y = 2, label = "1", size = 6) + 
  annotate("text", x = 2, y = 2, label = "1", size = 6) +
  theme(plot.title=element_text(size=20,face="bold") ,axis.title=element_text(size=18),axis.text=element_text(size=18))

p1


ggsave("comments.pdf", width = 4.5, height = 4.5)


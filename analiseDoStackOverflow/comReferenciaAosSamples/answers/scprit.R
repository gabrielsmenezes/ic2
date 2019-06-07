library(ggplot2)


all=read.csv("date.csv", sep=",",header=T)

p1 <- ggplot(all, aes(factor(all$framework,levels = c("Android","Spring")), all$date)) + 
  geom_violin(width=1, trim=TRUE, fill="#87CEFA") + 
  scale_y_log10() +
  geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Answer Time") + xlab("Code Samples") + ylab("Date") + 
  annotate("text", x = 1, y = 2000, label = "2661", size = 6) + 
  annotate("text", x = 2, y = 1300, label = "1027", size = 6) +
  theme(plot.title=element_text(size=20,face="bold") ,axis.title=element_text(size=18),axis.text=element_text(size=18))

p1

ggsave("creationDate.pdf", width = 4.5, height = 4.5)

all=read.csv("data.csv", sep=",",header=T)



p1 <- ggplot(all, aes(factor(all$framework,levels = c("Android","Spring")), all$Score)) + 
  geom_violin(width=1, trim=TRUE, fill="#87CEFA") + 
  scale_y_log10() +
  geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Question score") + xlab("Code Samples") + ylab("Score") + 
  annotate("text", x = 1, y = 3, label = "2", size = 6) + 
  annotate("text", x = 2, y = 2, label = "1", size = 6) +
  theme(plot.title=element_text(size=20,face="bold") ,axis.title=element_text(size=18),axis.text=element_text(size=18))

p1

ggsave("score.pdf", width = 4.5, height = 4.5)

p1 <- ggplot(all, aes(factor(all$framework,levels = c("Android","Spring")), all$CommentCount + 0.1)) + 
  geom_violin(width=1, trim=TRUE, fill="#87CEFA") + 
  scale_y_log10() +
  geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Number of Comments") + xlab("Code Samples") + ylab("Comments") + 
  annotate("text", x = 1, y = 0.9, label = "1", size = 6) + 
  annotate("text", x = 2, y = 0.9, label = "1", size = 6) +
  theme(plot.title=element_text(size=20,face="bold") ,axis.title=element_text(size=18),axis.text=element_text(size=18))

p1

ggsave("comments.pdf", width = 4.5, height = 4.5)

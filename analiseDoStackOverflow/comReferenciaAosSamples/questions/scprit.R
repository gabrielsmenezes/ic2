library(ggplot2)
require(scales)


all=read.csv("datas.csv", sep=",",header=T)

p1 <- ggplot(all, aes(factor(all$framework,levels = c("Android","Spring")), all$delayBetweenQuestionCreationAndAnswerCreation + 0.1)) + 
  geom_violin(width=1, trim=TRUE, fill="#87CEFA") + 
  scale_y_log10() +
  geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Delay") + xlab("StackOverflow Questions") + ylab("Delay in days (log scale)") + 
  annotate("text", x = 1, y = 15, label = "20", size = 6) + 
  annotate("text", x = 2, y = 13, label = "18", size = 6) +
  theme(plot.title=element_text(size=20,face="bold") ,axis.title=element_text(size=18),axis.text=element_text(size=18))

p1

ggsave("creationDate.pdf", width = 4.5, height = 4.5)

all=read.csv("data.csv", sep=",",header=T)



p1 <- ggplot(all, aes(factor(all$framework,levels = c("Android","Spring")), all$Score)) + 
  geom_violin(width=1, trim=TRUE, fill="#87CEFA") + 
  scale_y_log10() +
  geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Score") + xlab("StackOverflow Questions") + ylab("Score (log scale)") + 
  annotate("text", x = 1, y = 3, label = "2", size = 6) + 
  annotate("text", x = 2, y = 3, label = "2", size = 6) +
  theme(plot.title=element_text(size=20,face="bold") ,axis.title=element_text(size=18),axis.text=element_text(size=18))

p1

ggsave("score.pdf", width = 4.5, height = 4.5)


p1 <- ggplot(all, aes(factor(all$framework,levels = c("Android","Spring")), all$ViewCount)) + 
  geom_violin(width=1, trim=TRUE, fill="#87CEFA") + 
   scale_y_log10(labels = comma) +
  geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Views") + xlab("StackOverflow Questions") + ylab("Views (log scale)") + 
  annotate("text", x = 1, y = 1500, label = "890", size = 6) + 
  annotate("text", x = 2, y = 2000, label = "1579", size = 6) +
  theme(plot.title=element_text(size=20,face="bold") ,axis.title=element_text(size=18),axis.text=element_text(size=18))

p1

ggsave("views.pdf", width = 4.5, height = 4.5)

p1 <- ggplot(all, aes(factor(all$framework,levels = c("Android","Spring")), all$AnswerCount)) + 
  geom_violin(width=1, trim=TRUE, fill="#87CEFA") + 
  scale_y_log10() +
  geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Answer") + xlab("StackOverflow Questions") + ylab("Answers (log scale)") + 
  annotate("text", x = 1, y = 1.2, label = "1", size = 6) + 
  annotate("text", x = 2, y = 1.2, label = "1", size = 6) +
  theme(plot.title=element_text(size=20,face="bold") ,axis.title=element_text(size=18),axis.text=element_text(size=18))

p1

ggsave("answer.pdf", width = 4.5, height = 4.5)

p1 <- ggplot(all, aes(factor(all$framework,levels = c("Android","Spring")), all$CommentCount)) + 
  geom_violin(width=1, trim=TRUE, fill="#87CEFA") + 
  #scale_y_log10(breaks = c(0, 1, 10)) +
  geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Comments") + xlab("StackOverflow Questions") + ylab("Comments") + 
  annotate("text", x = 1, y = 0.9, label = "1", size = 6) + 
  annotate("text", x = 2, y = 0.2, label = "0", size = 6) +
  theme(plot.title=element_text(size=20,face="bold") ,axis.title=element_text(size=18),axis.text=element_text(size=18))

p1

ggsave("comments.pdf", width = 4.5, height = 4.5)

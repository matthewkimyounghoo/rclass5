library(rJava)
library(DBI)
library(RJDBC)
library(XML)
library(memoise)
library(KoNLP)
library(wordcloud)
library(dplyr)
library(ggplot2)
library(ggmap)
library(rvest)
library(RColorBrewer)
library(data.table)
library(reshape)
library(stringr)
getwd()
list.files()
KoNLP::useSejongDic()
kk<-readLines("jeju.txt")
kk<-gsub("\\d+","",kk)
kk <- sapply(kk,extractNoun,USE.NAMES = F)
kk <- unlist(kk)
myGsub1 <- readLines("제주도여행코스gsub.txt")
i <- 1
for (i in 1:length(myGsub1)){kk<-gsub(myGsub1[i],"",kk)}
kk <- Filter(function(x){!nchar(x)==1},kk)
kk <- Filter(function(x){nchar(x)<=10},kk)
head(sort(kk,decreasing=T),20)
write(unlist(kk),"jeju2.txt")
kk <- read.table("jeju2.txt")
kk <- table(kk)
head(sort(kk,decreasing=T),20)
pal <- brewer.pal(8,"Dark2")
set.seed(1234)
wordcloud::wordcloud(names(kk),
                     freq=kk,
                     min.freq = 1,
                     random.order = F,
                     rot.per = 0.25,
                     scale=c(5,1),
                     colors=pal)
legend(
  0.3,
  1,
  "제주도 추천 여행 코스 분석",
  cex=0.8,
  fill=NA,
  border = NA,
  text.col="red",
  box.col = "red"
)

top <- head(
  sort(kk,decreasing = T),
  40
)
top10 <- c(
  "중문","주상절리","성산","천지연폭포","한라산","산방산",
  "섭지코지","송악산","신창","산굼부리")
top10count <- c(
  13,12,10,9,9,8,6,6,7,5)
par(mfrow=c(1,2))
barplot(top10count,names.arg=top10,main="가장 많이 나온 단어",col=rainbow(10))
legend(
  7.5,
  12,
  top10,
  cex=0.6, ##글자크기
  fill = rainbow(10)
)
pie(top10count,radius = 1,init.angle = 90,col = rainbow(length(top10)),label=top10,main="가장 많이 나온 단어")

barplot(top10count, 
        main="가장 많이 나온 단어",
        names.arg=top10, 
        ylim<-c(0,15)
)


barplot(
  as.matrix(yy),
  main = "가장 많이 나온 단어",
  beside = T,
  col = rainbow(nrow(yy)),
  ylim<-c(0,400)
)

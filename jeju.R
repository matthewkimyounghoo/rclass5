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
kk<-readLines("seoul_go.txt")
kk<-gsub("\\d+","",kk)
kk <- sapply(kk,extractNoun,USE.NAMES = F)
kk <- unlist(kk)
myGsub1 <- readLines("myGsub1.txt")
i <- 1
for (i in 1:length(myGsub1)){kk<-gsub(myGsub1[i],"",kk)}
kk <- Filter(function(x){!nchar(x)==1},kk)
kk <- Filter(function(x){nchar(x)<=10},kk)
head(sort(kk,decreasing=T),20)
write(unlist(kk),"seoul_go2.txt")
kk <- read.table("seoul_go2.txt")
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


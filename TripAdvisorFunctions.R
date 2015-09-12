#TripAdvisorFunctions

#This takes a vector of text and cleans them- we keep similar functions that are used to clean twitter
#Data a lot. This then then returns them back as a character vector. 
library(RWeka)
library(ngram)
library("tm")
library(stringr)
library(lubridate)
library(sentiment)
library(plyr)
library(ggplot2)
library(wordcloud)
library(RColorBrewer)
library(dplyr)

clean.text = function(x)
{
  # remove at
  x = gsub("@\\w+", "", x)
  # remove punctuation
  x = gsub("[[:punct:]]", "", x)
  # remove numbers
  x = gsub("[[:digit:]]", " ", x)
  x=str_replace_all(x,"[^[:graph:]]", " ") 
  # remove links http
  x = gsub("http\\w+", " ", x)
  # remove tabs
  x = gsub("[ |\t]{2,}", " ", x)
  # remove blank spaces at the beginning
  x = gsub("^ ", " ", x)
  # remove blank spaces at the end
  x = gsub(" $", " ", x)
  x = tolower(x)
  x = Corpus(VectorSource(x))
  x = tm_map(x, removeWords, c(stopwords("english"),"air force", "airforce", "twin towers", "world war I", 
                               "world war II", "pentagon", "oklahoma city", "new york", "new york city", 
                               "alabama", "civil rights", "memorial", "arlington", "national", "cemetary", 
                               "world war", "roosevelt", "that", "franklin", "fdr", "jefferson", "thomas", 
                               "holocaust", "jews", "camp", "concentration", "korean", "war",
                               "lincoln", "abraham", "slaves", "marine", "mcveigh", "timothy", 
                               "pentagon", "flight", "russia", "soviet", "wall", "tomb", "unknown",
                               "missing in action", "atrocities", "uss", "arizona", "japan", "japanese",
                               "pacific", "pearl", "harbor", "vietnam", "veterans", "martin luther king", 
                               "mlk", "dr", "reflecting pool", "washington monument", "ground zero",
                               "world trade center", "trade center", "world trade", "iwo jima", "nyc", "dc",
                               "changing of the guard", "changing guards", "new deal", "gettysburg address",
                               "lincolns","fdrs", "kennedys", "washingtons", "jeffersons", "mlks", "kings", 
                               "september", "th", "wwi", "wwii", "luther", "manhattan", "monuments",
                               "president", "jfk", "lennon", "korea", "australia", "yad vashem", "new england",
                               "miami", "shoes", "danube", "river", "bank", "hiroshima", "england", "bomber", "command",
                               "crazy horse", "horse", "kranji", "nanjing", "massacre", "japan", "china",
                               "topography"))
  x = data.frame(text=unlist(sapply(x, '[', "content")), stringsAsFactors=F)
  x = x$text
  return(x)
}

#This was an attempt at generating a function to create a dataframe. It works, but I question it's usefulness.
TripAdvisor.DataFrame <- function(x){
  date <- readline("What is the date? YYYY/MM/DD")  
  experiencial <- readline("Is it experencial? (1/0)")
  overt <- readline("Is it an overt memorial? (1/0)")
  walkaround <- readline("Can you walk around? (1/0)")
  event <- readline("Does it represent an event?")
  group <- readline("Does it represent a group?")
  person <- readline("Does it represent a person?")
  name <- readline("What is it called?")
  listnames <- readline("Does it list the names of the individuals?")
  date <- unlist(strsplit(date, ","))
  experiencial <- as.numeric(unlist(strsplit(experiencial, ",")))
  overt <- as.numeric(unlist(strsplit(overt, ",")))
  walkaround <- as.numeric(unlist(strsplit(walkaround, ",")))
  event<- as.numeric(unlist(strsplit(event, ",")))
  group<- as.numeric(unlist(strsplit(group, ",")))
  person<- as.numeric(unlist(strsplit(person, ",")))
  listnames <- as.numeric(unlist(strsplit(listnames, ",")))
  name<- strsplit(name, " ")
  x <- x[,c(-1, -5, -6, -8)]
  colnames(x)[1]<-"Name"
  colnames(x)[2]<-"Top.Quote"
  colnames(x)[3]<-"Date"
  colnames(x)[4]<-"Rating"
  colnames(x)[5]<-"Full.Review"
  x$Language <- rep(NA, nrow(x))
  x$TripAdvisor <-rep(1, nrow(x))
  MemoryDate <-(ymd(date)-ymd("2015/01/01"))
  x$MemoryDate <- rep(MemoryDate, nrow(x))
  x$Experiencial <-rep(experiencial, nrow(x))
  x$Overt <- rep(overt, nrow(x))
  x$WalkAround <- rep(walkaround,nrow(x))
  x$Event <- rep(event,nrow(x))
  x$Group <- rep(group,nrow(x))
  x$Person <- rep(person,nrow(x))
  x$ListNames <- rep(listnames,nrow(x))
  x$MonumentName <- rep(name,nrow(x))
  rm(MemoryDate)
  return(x)
  
}
#This function formats the Emotional Dataset in descending order, and gives proper labels
formatEmotion.data = function(x) {
  first.freq = as.integer(x[1,2])
  first.percent = as.numeric(x[1,3])
  second.freq = as.integer(x[2,2])
  second.percent =as.numeric(x[2,3])
  third.freq = as.integer(x[3,2])
  third.percent = as.numeric(x[3,3])
  fourth.freq = as.integer(x[4,2])
  fourth.percent = as.numeric(x[4,3])
  fifth.freq = as.integer(x[5,2])
  fifth.percent = as.numeric(x[5,3])
  sixth.freq = as.integer(x[6,2])
  sixth.percent = as.numeric(x[6,3])
  seventh.freq = as.integer(x[7,2])
  seventh.percent = as.numeric(x[7,3])
  id = x[1,4]
  y = data.frame(first.freq, first.percent, second.freq, second.percent, third.freq, third.percent, fourth.freq, fourth.percent, fifth.freq, fifth.percent, sixth.freq, sixth.percent, seventh.freq, seventh.percent, id, stringsAsFactors=TRUE)
  colnames(y)[1]<-paste(x[1,1],"freq",sep = "_")
  colnames(y)[2]<-paste(x[1,1],"percent",sep = "_")
  colnames(y)[3]<-paste(x[2,1],"freq",sep = "_")
  colnames(y)[4]<-paste(x[2,1],"percent",sep = "_")
  colnames(y)[5]<-paste(x[3,1],"freq",sep = "_")
  colnames(y)[6]<-paste(x[3,1],"percent",sep = "_")
  colnames(y)[7]<-paste(x[4,1],"freq",sep = "_")
  colnames(y)[8]<-paste(x[4,1],"percent",sep = "_")
  colnames(y)[9]<-paste(x[5,1],"freq",sep = "_")
  colnames(y)[10]<-paste(x[5,1],"percent",sep = "_")
  colnames(y)[11]<-paste(x[6,1],"freq",sep = "_")
  colnames(y)[12]<-paste(x[6,1],"percent",sep = "_")
  colnames(y)[13]<-paste(x[7,1],"freq",sep = "_")
  colnames(y)[14]<-paste(x[7,1],"percent",sep = "_")
  colnames(y)[15]<- "MonumentName"
  return(y)
}



flip.bigramdataframe <- function(TextData, MonumentName){
  y <- NGramTokenizer(TextData, Weka_control(min=2, max=2))
  y <- sort(table(y), decreasing=T)
  y <- as.data.frame(y)
  y$Bigram <- row.names(y)
  colnames(y)[1] <- "Count"
  y = y[order(-y$Count),]
  row.names(y) <- NULL
  MonumentName <- MonumentName
  y  <-cbind(y, MonumentName)
  y <- y %>% select(MonumentName, everything())
  melted_y <- melt(y, id=c("MonumentName", "Bigram"), measure="Count", variable.name="test")
  return(melted_y)
}  

#Need to figure out a way to get 
flip.bigramtenpercent <- function(TextData, MonumentName){
  y <- NGramTokenizer(TextData, Weka_control(min=2, max=2))
  y <- sort(table(y), decreasing=T)
  x<- as.numeric(NROW(y))
  MonumentName <- MonumentName
  y <- t(y)
  y  <-cbind(y,MonumentName)
  y <- data.frame(y)
  y <- y %>% select(MonumentName, everything())
  y <- y[,1:(x*.1)]
}

flip.bigramtenpercent2 <- function(TextData, MonumentName){
y <- NGramTokenizer(TextData, Weka_control(min=2, max=2))
y <- sort(table(y), decreasing=T)
y <- t(t(y))
y <- as.data.frame(y)
y$names <- row.names(y)
row.names(y)<- NULL
colnames(y)[1]="Count"
colnames(y)[2]="Word"
y <-dplyr::arrange(y, desc(Count))
x<- as.numeric(NROW(y))
yy <- y[1:(x*.1),]
yy <- yy %>% select(Word, everything())
yy <- sort(table(yy), decreasing=T)
return(yy)
}


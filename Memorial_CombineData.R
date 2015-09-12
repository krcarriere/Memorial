setwd("/Users/kevincarriere/Desktop/BigDataProjects/TripAdvisor_Data/DataCSVs")
rm(list=(ls()))
library(lubridate)

######
#Keeping:
#ID (Becomes Name) | TopQuote (NA for YP) | RatingDt (Date for TA) | RatingNum (Rating for TA) | FullRev (FullReview for TA)
######

#Dropping:
# X / Rating / PartialEntry

###
#Coding Scheme for Memorials Is As Followed:

#Experiencial: Designed for emotional reaction.
#Overt: Overt statue of person present.
#WalkAround: Ability to explore -- beyond a single statue. 
#Event: Is this memorializing an event?
#Group: Is this memorializing a group?
#Person: Is this memorializing a person?

#Years from When It Occurred if Event. If Group, then year since group was created. If person, years from biggest event.


###
#Airforce
#Date Founded: 18 September 1947
###
TA_Airforce <- read.csv("TA_airforce.csv", header=TRUE , stringsAsFactors=FALSE)
TA_Airforce <- TA_Airforce[,c(-1, -5, -6, -8)]
colnames(TA_Airforce)[1]<-"Name"
colnames(TA_Airforce)[2]<-"Top.Quote"
colnames(TA_Airforce)[3]<-"Date"
colnames(TA_Airforce)[4]<-"Rating"
colnames(TA_Airforce)[5]<-"Full.Review"
TA_Airforce$Language <- rep(NA, nrow(TA_Airforce))
TA_Airforce$TripAdvisor <-rep(1, nrow(TA_Airforce))

YP_Airforce <- read.csv("YP_AirForceMemorial.csv", header=TRUE, stringsAsFactors=FALSE)
YP_Airforce$Language <- as.factor(YP_Airforce$Language)
YP_Airforce$Top.Quote <- rep(NA, nrow(YP_Airforce))
YP_Airforce$TripAdvisor <- rep(0, nrow(YP_Airforce))

AirForceMemorial <- rbind(YP_Airforce,TA_Airforce)
MemoryDate <-(ymd("1947/09/18")-ymd("2015/01/01"))
AirForceMemorial$MemoryDate <- rep(MemoryDate, nrow(AirForceMemorial))
AirForceMemorial$Experiencial <-rep(0, nrow(AirForceMemorial))
AirForceMemorial$Overt <- rep(1, nrow(AirForceMemorial))
AirForceMemorial$WalkAround <- rep(1, nrow(AirForceMemorial))
AirForceMemorial$Event <- rep(0, nrow(AirForceMemorial))
AirForceMemorial$Group <- rep(1, nrow(AirForceMemorial))
AirForceMemorial$Person <- rep(0, nrow(AirForceMemorial))
AirForceMemorial$ListNames <- rep(0,nrow(AirForceMemorial))
AirForceMemorial$MonumentName <- rep("Air Force",nrow(AirForceMemorial))
AirForceMemorial <- AirForceMemorial[-1,]
rm(TA_Airforce, YP_Airforce, MemoryDate)


###
#Australian War Memorial
#June 8th, 1944
###
AustralianWar <- read.csv("TA_australianwarmemorial.csv", header=TRUE , stringsAsFactors=FALSE)
AustralianWar <- AustralianWar[,c(-1, -5, -6, -8)]
colnames(AustralianWar)[1]<-"Name"
colnames(AustralianWar)[2]<-"Top.Quote"
colnames(AustralianWar)[3]<-"Date"
colnames(AustralianWar)[4]<-"Rating"
colnames(AustralianWar)[5]<-"Full.Review"
AustralianWar$Language <- rep(NA, nrow(AustralianWar))
AustralianWar$TripAdvisor <-rep(1, nrow(AustralianWar))
MemoryDate <-(ymd("1944/06/08")-ymd("2015/01/01"))
AustralianWar$MemoryDate <- rep(MemoryDate, nrow(AustralianWar))
AustralianWar$Experiencial <-rep(0, nrow(AustralianWar))
AustralianWar$Overt <- rep(1, nrow(AustralianWar))
AustralianWar$WalkAround <- rep(1,nrow(AustralianWar))
AustralianWar$Event <- rep(0,nrow(AustralianWar))
AustralianWar$Group <- rep(1,nrow(AustralianWar))
AustralianWar$Person <- rep(0,nrow(AustralianWar))
AustralianWar$ListNames <- rep(0,nrow(AustralianWar))
AustralianWar$MonumentName <- rep("Australian War Memorial",nrow(AustralianWar))
rm(MemoryDate)

###
##Arlington National Cemetary
#Created on May 13, 1864
###
TA_Arlington <- read.csv("TA_Arlington.csv", header=TRUE , stringsAsFactors=FALSE)
TA_Arlington <- TA_Arlington[,c(-1, -5, -6, -8)]
colnames(TA_Arlington)[1]<-"Name"
colnames(TA_Arlington)[2]<-"Top.Quote"
colnames(TA_Arlington)[3]<-"Date"
colnames(TA_Arlington)[4]<-"Rating"
colnames(TA_Arlington)[5]<-"Full.Review"
TA_Arlington$Language <- rep(NA, nrow(TA_Arlington))
TA_Arlington$TripAdvisor <-rep(1, nrow(TA_Arlington))

YP_Arlington <-read.csv("YP_Arlington.csv", header=TRUE, na.strings=c("", "NA"), stringsAsFactors=FALSE)
YP_Arlington <- na.omit(YP_Arlington)
YP_Arlington$Language <- as.factor(YP_Arlington$Language)
YP_Arlington$Top.Quote <- rep(NA, nrow(YP_Arlington))
YP_Arlington$TripAdvisor <- rep(0, nrow(YP_Arlington))

Arlington <- rbind(TA_Arlington, YP_Arlington)
MemoryDate <-(ymd("1864/05/13")-ymd("2015/01/01"))
Arlington$MemoryDate <- rep(MemoryDate, nrow(Arlington))
Arlington$Experiencial <-rep(0, nrow(Arlington))
Arlington$Overt <- rep(1, nrow(Arlington))
Arlington$WalkAround <- rep(1,nrow(Arlington))
Arlington$Event <- rep(1,nrow(Arlington))
Arlington$Group <- rep(1,nrow(Arlington))
Arlington$Person <- rep(0,nrow(Arlington))
Arlington$ListNames <- rep(1,nrow(Arlington))
Arlington$MonumentName <- rep("Arlington Cemetary",nrow(Arlington))
rm(YP_Arlington, TA_Arlington, MemoryDate)

###
#Battleship Missouri Memorial
#Peace declared August 13th 1945
###
BattleshipMissouri <- read.csv("TA_battleshipmissouri.csv", header=TRUE, stringsAsFactors=FALSE)
BattleshipMissouri <- BattleshipMissouri[,c(-1, -5, -6, -8)]
colnames(BattleshipMissouri)[1]<-"Name"
colnames(BattleshipMissouri)[2]<-"Top.Quote"
colnames(BattleshipMissouri)[3]<-"Date"
colnames(BattleshipMissouri)[4]<-"Rating"
colnames(BattleshipMissouri)[5]<-"Full.Review"
BattleshipMissouri$Language <- rep(NA, nrow(BattleshipMissouri))
BattleshipMissouri$TripAdvisor <-rep(1, nrow(BattleshipMissouri))
MemoryDate <-(ymd("1945/08/13")-ymd("2015/01/01"))
BattleshipMissouri$MemoryDate <- rep(MemoryDate, nrow(BattleshipMissouri))
BattleshipMissouri$Experiencial <-rep(0, nrow(BattleshipMissouri))
BattleshipMissouri$Overt <- rep(1, nrow(BattleshipMissouri))
BattleshipMissouri$WalkAround <- rep(1,nrow(BattleshipMissouri))
BattleshipMissouri$Event <- rep(1,nrow(BattleshipMissouri))
BattleshipMissouri$Group <- rep(0,nrow(BattleshipMissouri))
BattleshipMissouri$Person <- rep(0,nrow(BattleshipMissouri))
BattleshipMissouri$ListNames <- rep(0,nrow(BattleshipMissouri))
BattleshipMissouri$MonumentName <- rep("U.S.S. Missouri Battleship Memorial",nrow(BattleshipMissouri))
rm(MemoryDate)
###
#RAF Bomber Command Memorial
#September 1st, 1939 - WWII
###
BomberCommand <- read.csv("TA_bombercommand.csv", header=TRUE , stringsAsFactors=FALSE)
BomberCommand <- BomberCommand[,c(-1, -5, -6, -8)]
colnames(BomberCommand)[1]<-"Name"
colnames(BomberCommand)[2]<-"Top.Quote"
colnames(BomberCommand)[3]<-"Date"
colnames(BomberCommand)[4]<-"Rating"
colnames(BomberCommand)[5]<-"Full.Review"
BomberCommand$Language <- rep(NA, nrow(BomberCommand))
BomberCommand$TripAdvisor <-rep(1, nrow(BomberCommand))
MemoryDate <-(ymd("1939/09/01")-ymd("2015/01/01"))
BomberCommand$MemoryDate <- rep(MemoryDate, nrow(BomberCommand))
BomberCommand$Experiencial <-rep(0, nrow(BomberCommand))
BomberCommand$Overt <- rep(1, nrow(BomberCommand))
BomberCommand$WalkAround <- rep(0,nrow(BomberCommand))
BomberCommand$Event <- rep(0,nrow(BomberCommand))
BomberCommand$Group <- rep(1,nrow(BomberCommand))
BomberCommand$Person <- rep(0,nrow(BomberCommand))
BomberCommand$ListNames <- rep(0,nrow(BomberCommand))
BomberCommand$MonumentName <- rep("RAF Bomber Command Memorial",nrow(BomberCommand))
rm(MemoryDate)

###
#Chiang Kai-Shek Memorial Hall
#Taiwan
#Born October 31, 1887
###
ChiangKaiShek <- read.csv("TA_chiang.csv", header=TRUE , stringsAsFactors=FALSE)
ChiangKaiShek <- ChiangKaiShek[,c(-1, -5, -6, -8)]
colnames(ChiangKaiShek)[1]<-"Name"
colnames(ChiangKaiShek)[2]<-"Top.Quote"
colnames(ChiangKaiShek)[3]<-"Date"
colnames(ChiangKaiShek)[4]<-"Rating"
colnames(ChiangKaiShek)[5]<-"Full.Review"
ChiangKaiShek$Language <- rep(NA, nrow(ChiangKaiShek))
ChiangKaiShek$TripAdvisor <-rep(1, nrow(ChiangKaiShek))
MemoryDate <-(ymd("1887/10/31")-ymd("2015/01/01"))
ChiangKaiShek$MemoryDate <- rep(MemoryDate, nrow(ChiangKaiShek))
ChiangKaiShek$Experiencial <-rep(0, nrow(ChiangKaiShek))
ChiangKaiShek$Overt <- rep(0, nrow(ChiangKaiShek))
ChiangKaiShek$WalkAround <- rep(1,nrow(ChiangKaiShek))
ChiangKaiShek$Event <- rep(0,nrow(ChiangKaiShek))
ChiangKaiShek$Group <- rep(0,nrow(ChiangKaiShek))
ChiangKaiShek$Person <- rep(1,nrow(ChiangKaiShek))
ChiangKaiShek$ListNames <- rep(0,nrow(ChiangKaiShek))
ChiangKaiShek$MonumentName <- rep("Chiang Kai-Shek Memorial Hall",nrow(ChiangKaiShek))
rm(MemoryDate)

###
#Alabama Civil Rights Memorial
#Date: Brown v Board: May 17, 1954
###
TA_CivilRights <- read.csv("TA_CivilRights.csv", header=TRUE , stringsAsFactors=FALSE)
TA_CivilRights <- TA_CivilRights[,c(-1, -5, -6, -8)]
colnames(TA_CivilRights)[1]<-"Name"
colnames(TA_CivilRights)[2]<-"Top.Quote"
colnames(TA_CivilRights)[3]<-"Date"
colnames(TA_CivilRights)[4]<-"Rating"
colnames(TA_CivilRights)[5]<-"Full.Review"
TA_CivilRights$Language <- rep(NA, nrow(TA_CivilRights))
TA_CivilRights$TripAdvisor <-rep(1, nrow(TA_CivilRights))

YP_CivilRights <-read.csv("YP_CivilRights.csv", header=TRUE, na.strings=c("", "NA"), stringsAsFactors=FALSE)
YP_CivilRights <- na.omit(YP_CivilRights)
YP_CivilRights$Language <- as.factor(YP_CivilRights$Language)
YP_CivilRights$Top.Quote <- rep(NA, nrow(YP_CivilRights))
YP_CivilRights$TripAdvisor <- rep(0, nrow(YP_CivilRights))

CivilRights <- rbind(YP_CivilRights, TA_CivilRights)
MemoryDate <-(ymd("1954/05/17")-ymd("2015/01/01"))
CivilRights$MemoryDate <- rep(MemoryDate, nrow(CivilRights))
CivilRights$Experiencial <-rep(1, nrow(CivilRights))
CivilRights$Overt <- rep(0, nrow(CivilRights))
CivilRights$WalkAround <- rep(0,nrow(CivilRights))
CivilRights$Event <- rep(1,nrow(CivilRights))
CivilRights$Group <- rep(1,nrow(CivilRights))
CivilRights$Person <- rep(0,nrow(CivilRights))
CivilRights$ListNames <- rep(1,nrow(CivilRights))
CivilRights$MonumentName <- rep("Alabama Civil Rights Memorial",nrow(CivilRights))
rm(YP_CivilRights,TA_CivilRights, MemoryDate)

#Crazy Horse
# Died September 5th 1877
CrazyHorse <- read.csv("TA_crazyhorse.csv", header=TRUE , stringsAsFactors=FALSE)
CrazyHorse <- CrazyHorse[,c(-1, -5, -6, -8)]
colnames(CrazyHorse)[1]<-"Name"
colnames(CrazyHorse)[2]<-"Top.Quote"
colnames(CrazyHorse)[3]<-"Date"
colnames(CrazyHorse)[4]<-"Rating"
colnames(CrazyHorse)[5]<-"Full.Review"
CrazyHorse$Language <- rep(NA, nrow(CrazyHorse))
CrazyHorse$TripAdvisor <-rep(1, nrow(CrazyHorse))
MemoryDate <-(ymd("1877/09/05")-ymd("2015/01/01"))
CrazyHorse$MemoryDate <- rep(MemoryDate, nrow(CrazyHorse))
CrazyHorse$Experiencial <-rep(0, nrow(CrazyHorse))
CrazyHorse$Overt <- rep(1, nrow(CrazyHorse))
CrazyHorse$WalkAround <- rep(0,nrow(CrazyHorse))
CrazyHorse$Event <- rep(0,nrow(CrazyHorse))
CrazyHorse$Group <- rep(0,nrow(CrazyHorse))
CrazyHorse$Person <- rep(1,nrow(CrazyHorse))
CrazyHorse$ListNames <- rep(0,nrow(CrazyHorse))
CrazyHorse$MonumentName <- rep("Crazy Horse Memorial",nrow(CrazyHorse))
rm(MemoryDate)

###
#The Memorial of the DanubeShoes Massacre
#January 8, 1945 - Born
###
DanubeShoes <- read.csv("TA_shoesdanube.csv", header=TRUE , stringsAsFactors=FALSE)
DanubeShoes <- DanubeShoes[,c(-1, -5, -6, -8)]
colnames(DanubeShoes)[1]<-"Name"
colnames(DanubeShoes)[2]<-"Top.Quote"
colnames(DanubeShoes)[3]<-"Date"
colnames(DanubeShoes)[4]<-"Rating"
colnames(DanubeShoes)[5]<-"Full.Review"
DanubeShoes$Language <- rep(NA, nrow(DanubeShoes))
DanubeShoes$TripAdvisor <-rep(1, nrow(DanubeShoes))
MemoryDate <-(ymd("1945/01/08")-ymd("2015/01/01"))
DanubeShoes$MemoryDate <- rep(MemoryDate, nrow(DanubeShoes))
DanubeShoes$Experiencial <-rep(1, nrow(DanubeShoes))
DanubeShoes$Overt <- rep(0, nrow(DanubeShoes))
DanubeShoes$WalkAround <- rep(1,nrow(DanubeShoes))
DanubeShoes$Event <- rep(1,nrow(DanubeShoes))
DanubeShoes$Group <- rep(0,nrow(DanubeShoes))
DanubeShoes$Person <- rep(0,nrow(DanubeShoes))
DanubeShoes$ListNames <- rep(0,nrow(DanubeShoes))
DanubeShoes$MonumentName <- rep("Shoes on the Danube Bank",nrow(DanubeShoes))
rm(MemoryDate)

###
# DC World War I Memorial
# Began 28 July 1914.
###
TA_DCWWI <- read.csv("TA_DCWWI.csv", header=TRUE , stringsAsFactors=FALSE)
TA_DCWWI <- TA_DCWWI[,c(-1, -5, -6, -8)]
colnames(TA_DCWWI)[1]<-"Name"
colnames(TA_DCWWI)[2]<-"Top.Quote"
colnames(TA_DCWWI)[3]<-"Date"
colnames(TA_DCWWI)[4]<-"Rating"
colnames(TA_DCWWI)[5]<-"Full.Review"
TA_DCWWI$Language <- rep(NA, nrow(TA_DCWWI))
TA_DCWWI$TripAdvisor <-rep(1, nrow(TA_DCWWI))

YP_DCWWI <-read.csv("YP_DCWWI.csv", header=TRUE, na.strings=c("", "NA"), stringsAsFactors=FALSE)
YP_DCWWI <- na.omit(YP_DCWWI)
YP_DCWWI$Language <- as.factor(YP_DCWWI$Language)
YP_DCWWI$Top.Quote <- rep(NA, nrow(YP_DCWWI))
YP_DCWWI$TripAdvisor <- rep(0, nrow(YP_DCWWI))

DCWWI <- rbind(YP_DCWWI, TA_DCWWI)
MemoryDate <-(ymd("1941/07/28")-ymd("2015/01/01"))
DCWWI$MemoryDate <- rep(MemoryDate, nrow(DCWWI))
DCWWI$Experiencial <-rep(0, nrow(DCWWI))
DCWWI$Overt <- rep(0, nrow(DCWWI))
DCWWI$WalkAround <- rep(0,nrow(DCWWI))
DCWWI$Event <- rep(1,nrow(DCWWI))
DCWWI$Group <- rep(0,nrow(DCWWI))
DCWWI$Person <- rep(0,nrow(DCWWI))
DCWWI$ListNames <- rep(0,nrow(DCWWI))
DCWWI$MonumentName <- rep("DC World War I Memorial",nrow(DCWWI))
rm(YP_DCWWI,TA_DCWWI, MemoryDate)


###
#FDR Memorial
#President until April 12, 1945
###
TA_FDR <- read.csv("TA_FDR.csv", header=TRUE , stringsAsFactors=FALSE)
TA_FDR <- TA_FDR[,c(-1, -5, -6, -8)]
colnames(TA_FDR)[1]<-"Name"
colnames(TA_FDR)[2]<-"Top.Quote"
colnames(TA_FDR)[3]<-"Date"
colnames(TA_FDR)[4]<-"Rating"
colnames(TA_FDR)[5]<-"Full.Review"
TA_FDR$Language <- rep(NA, nrow(TA_FDR))
TA_FDR$TripAdvisor <-rep(1, nrow(TA_FDR))

YP_FDR <-read.csv("YP_FDR.csv", header=TRUE, na.strings=c("", "NA"), stringsAsFactors=FALSE)
YP_FDR <- na.omit(YP_FDR)
YP_FDR$Language <- as.factor(YP_FDR$Language)
YP_FDR$Top.Quote <- rep(NA, nrow(YP_FDR))
YP_FDR$TripAdvisor <- rep(0, nrow(YP_FDR))

FDR <- rbind(YP_FDR, TA_FDR)
MemoryDate <-(ymd("1945/04/12")-ymd("2015/01/01"))
FDR$MemoryDate <- rep(MemoryDate, nrow(FDR))
FDR$Experiencial <-rep(0, nrow(FDR))
FDR$Overt <- rep(1, nrow(FDR))
FDR$WalkAround <- rep(1,nrow(FDR))
FDR$Event <- rep(0,nrow(FDR))
FDR$Group <- rep(0,nrow(FDR))
FDR$Person <- rep(1,nrow(FDR))
FDR$ListNames <- rep(0,nrow(FDR))
FDR$MonumentName <- rep("Franklin Delanore Roosevelt Memorial",nrow(FDR))
rm(YP_FDR,TA_FDR, MemoryDate)

###
#Hiroshima Peace
# Died August 6, 1945
###
HiroshimaPeace <- read.csv("TA_hiroshimapeace.csv", header=TRUE , stringsAsFactors=FALSE)
HiroshimaPeace <- HiroshimaPeace[,c(-1, -5, -6, -8)]
colnames(HiroshimaPeace)[1]<-"Name"
colnames(HiroshimaPeace)[2]<-"Top.Quote"
colnames(HiroshimaPeace)[3]<-"Date"
colnames(HiroshimaPeace)[4]<-"Rating"
colnames(HiroshimaPeace)[5]<-"Full.Review"
HiroshimaPeace$Language <- rep(NA, nrow(HiroshimaPeace))
HiroshimaPeace$TripAdvisor <-rep(1, nrow(HiroshimaPeace))
MemoryDate <-(ymd("1945/08/06")-ymd("2015/01/01"))
HiroshimaPeace$MemoryDate <- rep(MemoryDate, nrow(HiroshimaPeace))
HiroshimaPeace$Experiencial <-rep(0, nrow(HiroshimaPeace))
HiroshimaPeace$Overt <- rep(0, nrow(HiroshimaPeace))
HiroshimaPeace$WalkAround <- rep(0,nrow(HiroshimaPeace))
HiroshimaPeace$Event <- rep(1,nrow(HiroshimaPeace))
HiroshimaPeace$Group <- rep(0,nrow(HiroshimaPeace))
HiroshimaPeace$Person <- rep(0,nrow(HiroshimaPeace))
HiroshimaPeace$ListNames <- rep(0,nrow(HiroshimaPeace))
HiroshimaPeace$MonumentName <- rep("Hiroshima Peace Memorial",nrow(HiroshimaPeace))
rm(MemoryDate)

###
#Jefferson
#President: March 4, 1809
###
TA_Jefferson <- read.csv("TA_Jefferson.csv", header=TRUE , stringsAsFactors=FALSE)
TA_Jefferson <- TA_Jefferson[,c(-1, -5, -6, -8)]
colnames(TA_Jefferson)[1]<-"Name"
colnames(TA_Jefferson)[2]<-"Top.Quote"
colnames(TA_Jefferson)[3]<-"Date"
colnames(TA_Jefferson)[4]<-"Rating"
colnames(TA_Jefferson)[5]<-"Full.Review"
TA_Jefferson$Language <- rep(NA, nrow(TA_Jefferson))
TA_Jefferson$TripAdvisor <-rep(1, nrow(TA_Jefferson))

YP_Jefferson <-read.csv("YP_Jefferson.csv", header=TRUE, na.strings=c("", "NA"), stringsAsFactors=FALSE)
YP_Jefferson <- na.omit(YP_Jefferson)
YP_Jefferson$Language <- as.factor(YP_Jefferson$Language)
YP_Jefferson$Top.Quote <- rep(NA, nrow(YP_Jefferson))
YP_Jefferson$TripAdvisor <- rep(0, nrow(YP_Jefferson))

Jefferson <- rbind(YP_Jefferson, TA_Jefferson)
MemoryDate <-(ymd("1809/03/04")-ymd("2015/01/01"))
Jefferson$MemoryDate <- rep(MemoryDate, nrow(Jefferson))
Jefferson$Experiencial <-rep(0, nrow(Jefferson))
Jefferson$Overt <- rep(1, nrow(Jefferson))
Jefferson$WalkAround <- rep(0,nrow(Jefferson))
Jefferson$Event <- rep(0,nrow(Jefferson))
Jefferson$Group <- rep(0,nrow(Jefferson))
Jefferson$Person <- rep(1,nrow(Jefferson))
Jefferson$ListNames <- rep(0,nrow(Jefferson))
Jefferson$MonumentName <- rep("Thomas Jefferson Memorial",nrow(Jefferson))
rm(YP_Jefferson,TA_Jefferson, MemoryDate)

###
#Jews Berlin
#January 30, 1933 : Hitler gains control.
###
TA_JewsBerlin <- read.csv("TA_JewsBerlin.csv", header=TRUE , stringsAsFactors=FALSE)
TA_JewsBerlin <- TA_JewsBerlin[,c(-1, -2, -6, -7, -9)]
colnames(TA_JewsBerlin)[1]<-"Name"
colnames(TA_JewsBerlin)[2]<-"Top.Quote"
colnames(TA_JewsBerlin)[3]<-"Date"
colnames(TA_JewsBerlin)[4]<-"Rating"
colnames(TA_JewsBerlin)[5]<-"Full.Review"
TA_JewsBerlin$Language <- rep(NA, nrow(TA_JewsBerlin))
TA_JewsBerlin$TripAdvisor <-rep(1, nrow(TA_JewsBerlin))

YP_JewsBerlin <-read.csv("YP_JewsBerlin.csv", header=TRUE, na.strings=c("", "NA"), stringsAsFactors=FALSE)
YP_JewsBerlin <- na.omit(YP_JewsBerlin)
YP_JewsBerlin$Language <- as.factor(YP_JewsBerlin$Language)
YP_JewsBerlin$Top.Quote <- rep(NA, nrow(YP_JewsBerlin))
YP_JewsBerlin$TripAdvisor <- rep(0, nrow(YP_JewsBerlin))

JewsBerlin <- rbind(YP_JewsBerlin, TA_JewsBerlin)
MemoryDate <-(ymd("1933/01/30")-ymd("2015/01/01"))
JewsBerlin$MemoryDate <- rep(MemoryDate, nrow(JewsBerlin))
JewsBerlin$Experiencial <-rep(1, nrow(JewsBerlin))
JewsBerlin$Overt <- rep(0, nrow(JewsBerlin))
JewsBerlin$WalkAround <- rep(1,nrow(JewsBerlin))
JewsBerlin$Event <- rep(1,nrow(JewsBerlin))
JewsBerlin$Group <- rep(0,nrow(JewsBerlin))
JewsBerlin$Person <- rep(0,nrow(JewsBerlin))
JewsBerlin$ListNames <- rep(0,nrow(JewsBerlin))
JewsBerlin$MonumentName <- rep("Memorial to Murdered Jews of Europe",nrow(JewsBerlin))
rm(YP_JewsBerlin,TA_JewsBerlin, MemoryDate)

###
#John Lennon Memorial
#October 9, 1940 - Born
###
JohnLennon <- read.csv("TA_johnlennon.csv", header=TRUE , stringsAsFactors=FALSE)
JohnLennon <- JohnLennon[,c(-1, -5, -6, -8)]
colnames(JohnLennon)[1]<-"Name"
colnames(JohnLennon)[2]<-"Top.Quote"
colnames(JohnLennon)[3]<-"Date"
colnames(JohnLennon)[4]<-"Rating"
colnames(JohnLennon)[5]<-"Full.Review"
JohnLennon$Language <- rep(NA, nrow(JohnLennon))
JohnLennon$TripAdvisor <-rep(1, nrow(JohnLennon))
MemoryDate <-(ymd("1940/10/09")-ymd("2015/01/01"))
JohnLennon$MemoryDate <- rep(MemoryDate, nrow(JohnLennon))
JohnLennon$Experiencial <-rep(0, nrow(JohnLennon))
JohnLennon$Overt <- rep(0, nrow(JohnLennon))
JohnLennon$WalkAround <- rep(0,nrow(JohnLennon))
JohnLennon$Event <- rep(0,nrow(JohnLennon))
JohnLennon$Group <- rep(0,nrow(JohnLennon))
JohnLennon$Person <- rep(1,nrow(JohnLennon))
JohnLennon$ListNames <- rep(0,nrow(JohnLennon))
JohnLennon$MonumentName <- rep("Strawyberry Fields - John Lennon Memorial",nrow(JohnLennon))
rm(MemoryDate)

###
#Korean War
#25th of June, 1950
###
TA_Korean <- read.csv("TA_Korean.csv", header=TRUE , stringsAsFactors=FALSE)
TA_Korean <- TA_Korean[,c(-1, -5, -6, -8)]
colnames(TA_Korean)[1]<-"Name"
colnames(TA_Korean)[2]<-"Top.Quote"
colnames(TA_Korean)[3]<-"Date"
colnames(TA_Korean)[4]<-"Rating"
colnames(TA_Korean)[5]<-"Full.Review"
TA_Korean$Language <- rep(NA, nrow(TA_Korean))
TA_Korean$TripAdvisor <-rep(1, nrow(TA_Korean))

YP_Korean <-read.csv("YP_Korean.csv", header=TRUE, na.strings=c("", "NA"), stringsAsFactors=FALSE)
YP_Korean <- na.omit(YP_Korean)
YP_Korean$Language <- as.factor(YP_Korean$Language)
YP_Korean$Top.Quote <- rep(NA, nrow(YP_Korean))
YP_Korean$TripAdvisor <- rep(0, nrow(YP_Korean))

Korean <- rbind(YP_Korean, TA_Korean)
MemoryDate <-(ymd("1950/06/25")-ymd("2015/01/01"))
Korean$MemoryDate <- rep(MemoryDate, nrow(Korean))
Korean$Experiencial <-rep(1, nrow(Korean))
Korean$Overt <- rep(1, nrow(Korean))
Korean$WalkAround <- rep(1,nrow(Korean))
Korean$Event <- rep(1,nrow(Korean))
Korean$Group <- rep(0,nrow(Korean))
Korean$Person <- rep(0,nrow(Korean))
Korean$ListNames <- rep(0,nrow(Korean))
Korean$MonumentName <- rep("Korean War Memorial",nrow(Korean))
rm(YP_Korean,TA_Korean, MemoryDate)

###
#Kranji War Memorial
#September 1, 1933 - Born
###
Kranji <- read.csv("TA_kranji.csv", header=TRUE , stringsAsFactors=FALSE)
Kranji <- Kranji[,c(-1, -5, -6, -8)]
colnames(Kranji)[1]<-"Name"
colnames(Kranji)[2]<-"Top.Quote"
colnames(Kranji)[3]<-"Date"
colnames(Kranji)[4]<-"Rating"
colnames(Kranji)[5]<-"Full.Review"
Kranji$Language <- rep(NA, nrow(Kranji))
Kranji$TripAdvisor <-rep(1, nrow(Kranji))
MemoryDate <-(ymd("1933/09/01")-ymd("2015/01/01"))
Kranji$MemoryDate <- rep(MemoryDate, nrow(Kranji))
Kranji$Experiencial <-rep(0, nrow(Kranji))
Kranji$Overt <- rep(0, nrow(Kranji))
Kranji$WalkAround <- rep(1,nrow(Kranji))
Kranji$Event <- rep(0,nrow(Kranji))
Kranji$Group <- rep(1,nrow(Kranji))
Kranji$Person <- rep(0,nrow(Kranji))
Kranji$ListNames <- rep(1,nrow(Kranji))
Kranji$MonumentName <- rep("Kranji War Memorial",nrow(Kranji))
rm(MemoryDate)

###
#Lincoln Memorial
#Died April 15, 1865
###
TA_LincolnMemorial <- read.csv("TA_LincolnMemorial.csv", header=TRUE , stringsAsFactors=FALSE)
TA_LincolnMemorial <- TA_LincolnMemorial[,c(-1, -5, -6, -8)]
colnames(TA_LincolnMemorial)[1]<-"Name"
colnames(TA_LincolnMemorial)[2]<-"Top.Quote"
colnames(TA_LincolnMemorial)[3]<-"Date"
colnames(TA_LincolnMemorial)[4]<-"Rating"
colnames(TA_LincolnMemorial)[5]<-"Full.Review"
TA_LincolnMemorial$Language <- rep(NA, nrow(TA_LincolnMemorial))
TA_LincolnMemorial$TripAdvisor <-rep(1, nrow(TA_LincolnMemorial))

YP_LincolnMemorial <-read.csv("YP_LincolnMemorial.csv", header=TRUE, na.strings=c("", "NA"), stringsAsFactors=FALSE)
YP_LincolnMemorial <- na.omit(YP_LincolnMemorial)
YP_LincolnMemorial$Language <- as.factor(YP_LincolnMemorial$Language)
YP_LincolnMemorial$Top.Quote <- rep(NA, nrow(YP_LincolnMemorial))
YP_LincolnMemorial$TripAdvisor <- rep(0, nrow(YP_LincolnMemorial))

LincolnMemorial <- rbind(YP_LincolnMemorial, TA_LincolnMemorial)
MemoryDate <-(ymd("1985/04/15")-ymd("2015/01/01"))
LincolnMemorial$MemoryDate <- rep(MemoryDate, nrow(LincolnMemorial))
LincolnMemorial$Experiencial <-rep(0, nrow(LincolnMemorial))
LincolnMemorial$Overt <- rep(1, nrow(LincolnMemorial))
LincolnMemorial$WalkAround <- rep(0,nrow(LincolnMemorial))
LincolnMemorial$Event <- rep(0,nrow(LincolnMemorial))
LincolnMemorial$Group <- rep(0,nrow(LincolnMemorial))
LincolnMemorial$Person <- rep(1,nrow(LincolnMemorial))
LincolnMemorial$ListNames <- rep(0,nrow(LincolnMemorial))
LincolnMemorial$MonumentName <- rep("Abraham Lincoln Memorial",nrow(LincolnMemorial))
rm(YP_LincolnMemorial,TA_LincolnMemorial, MemoryDate)

###
#Marine Corps Memorial
#Formed November 10th, 1775
###
TA_MarineCorps <- read.csv("TA_MarineCorps.csv", header=TRUE , stringsAsFactors=FALSE)
TA_MarineCorps <- TA_MarineCorps[,c(-1, -5, -6, -8)]
colnames(TA_MarineCorps)[1]<-"Name"
colnames(TA_MarineCorps)[2]<-"Top.Quote"
colnames(TA_MarineCorps)[3]<-"Date"
colnames(TA_MarineCorps)[4]<-"Rating"
colnames(TA_MarineCorps)[5]<-"Full.Review"
TA_MarineCorps$Language <- rep(NA, nrow(TA_MarineCorps))
TA_MarineCorps$TripAdvisor <-rep(1, nrow(TA_MarineCorps))

YP_MarineCorps <-read.csv("YP_MarineCorps.csv", header=TRUE, na.strings=c("", "NA"), stringsAsFactors=FALSE)
YP_MarineCorps <- na.omit(YP_MarineCorps)
YP_MarineCorps$Language <- as.factor(YP_MarineCorps$Language)
YP_MarineCorps$Top.Quote <- rep(NA, nrow(YP_MarineCorps))
YP_MarineCorps$TripAdvisor <- rep(0, nrow(YP_MarineCorps))

MarineCorps <- rbind(YP_MarineCorps, TA_MarineCorps)
MemoryDate <-(ymd("1975/11/10")-ymd("2015/01/01"))
MarineCorps$MemoryDate <- rep(MemoryDate, nrow(MarineCorps))
MarineCorps$Experiencial <-rep(0, nrow(MarineCorps))
MarineCorps$Overt <- rep(1, nrow(MarineCorps))
MarineCorps$WalkAround <- rep(0,nrow(MarineCorps))
MarineCorps$Event <- rep(0,nrow(MarineCorps))
MarineCorps$Group <- rep(1,nrow(MarineCorps))
MarineCorps$Person <- rep(0,nrow(MarineCorps))
MarineCorps$ListNames <- rep(0,nrow(MarineCorps))
MarineCorps$MonumentName <- rep("US Marine Corps Memorial",nrow(MarineCorps))
rm(YP_MarineCorps,TA_MarineCorps, MemoryDate)

###
#Miami Holocaust Memorial
#January 30th, 1933
###
MiamiHolocaust <- read.csv("TA_miamiholocaust.csv", header=TRUE , stringsAsFactors=FALSE)
MiamiHolocaust <- MiamiHolocaust[,c(-1, -5, -6, -8)]
colnames(MiamiHolocaust)[1]<-"Name"
colnames(MiamiHolocaust)[2]<-"Top.Quote"
colnames(MiamiHolocaust)[3]<-"Date"
colnames(MiamiHolocaust)[4]<-"Rating"
colnames(MiamiHolocaust)[5]<-"Full.Review"
MiamiHolocaust$Language <- rep(NA, nrow(MiamiHolocaust))
MiamiHolocaust$TripAdvisor <-rep(1, nrow(MiamiHolocaust))
MemoryDate <-(ymd("1933/01/30")-ymd("2015/01/01"))
MiamiHolocaust$MemoryDate <- rep(MemoryDate, nrow(MiamiHolocaust))
MiamiHolocaust$Experiencial <-rep(1, nrow(MiamiHolocaust))
MiamiHolocaust$Overt <- rep(1, nrow(MiamiHolocaust))
MiamiHolocaust$WalkAround <- rep(0,nrow(MiamiHolocaust))
MiamiHolocaust$Event <- rep(1,nrow(MiamiHolocaust))
MiamiHolocaust$Group <- rep(1,nrow(MiamiHolocaust))
MiamiHolocaust$Person <- rep(0,nrow(MiamiHolocaust))
MiamiHolocaust$ListNames <- rep(1,nrow(MiamiHolocaust))
MiamiHolocaust$MonumentName <- rep("Miami Holocaust Memorial",nrow(MiamiHolocaust))
rm(MemoryDate)

###
#The Memorial of the Nanjing Massacre
#December 13, 1937 - Born
###
Nanjing <- read.csv("TA_nanjing.csv", header=TRUE , stringsAsFactors=FALSE)
Nanjing <- Nanjing[,c(-1, -5, -6, -8)]
colnames(Nanjing)[1]<-"Name"
colnames(Nanjing)[2]<-"Top.Quote"
colnames(Nanjing)[3]<-"Date"
colnames(Nanjing)[4]<-"Rating"
colnames(Nanjing)[5]<-"Full.Review"
Nanjing$Language <- rep(NA, nrow(Nanjing))
Nanjing$TripAdvisor <-rep(1, nrow(Nanjing))
MemoryDate <-(ymd("1937/12/13")-ymd("2015/01/01"))
Nanjing$MemoryDate <- rep(MemoryDate, nrow(Nanjing))
Nanjing$Experiencial <-rep(1, nrow(Nanjing))
Nanjing$Overt <- rep(1, nrow(Nanjing))
Nanjing$WalkAround <- rep(1,nrow(Nanjing))
Nanjing$Event <- rep(1,nrow(Nanjing))
Nanjing$Group <- rep(0,nrow(Nanjing))
Nanjing$Person <- rep(0,nrow(Nanjing))
Nanjing$ListNames <- rep(0,nrow(Nanjing))
Nanjing$MonumentName <- rep("The Memorial of the Nanjing Massacre",nrow(Nanjing))
rm(MemoryDate)

###
#New England Holocaust Memorial
#January 30th, 1933
###
NEHolocaust <- read.csv("TA_newenglandholocaust.csv", header=TRUE , stringsAsFactors=FALSE)
NEHolocaust <- NEHolocaust[,c(-1, -5, -6, -8)]
colnames(NEHolocaust)[1]<-"Name"
colnames(NEHolocaust)[2]<-"Top.Quote"
colnames(NEHolocaust)[3]<-"Date"
colnames(NEHolocaust)[4]<-"Rating"
colnames(NEHolocaust)[5]<-"Full.Review"
NEHolocaust$Language <- rep(NA, nrow(NEHolocaust))
NEHolocaust$TripAdvisor <-rep(1, nrow(NEHolocaust))
MemoryDate <-(ymd("1933/01/30")-ymd("2015/01/01"))
NEHolocaust$MemoryDate <- rep(MemoryDate, nrow(NEHolocaust))
NEHolocaust$Experiencial <-rep(0, nrow(NEHolocaust))
NEHolocaust$Overt <- rep(0, nrow(NEHolocaust))
NEHolocaust$WalkAround <- rep(1,nrow(NEHolocaust))
NEHolocaust$Event <- rep(1,nrow(NEHolocaust))
NEHolocaust$Group <- rep(1,nrow(NEHolocaust))
NEHolocaust$Person <- rep(0,nrow(NEHolocaust))
NEHolocaust$ListNames <- rep(1,nrow(NEHolocaust))
NEHolocaust$MonumentName <- rep("New England Holocaust Memorial",nrow(NEHolocaust))
rm(MemoryDate)


###
#Normandy American Cemetery and Memorial
#June 8th, 1944
###
NormandyUSA <- read.csv("TA_normandyamerican.csv", header=TRUE , stringsAsFactors=FALSE)
NormandyUSA <- NormandyUSA[,c(-1, -5, -6, -8)]
colnames(NormandyUSA)[1]<-"Name"
colnames(NormandyUSA)[2]<-"Top.Quote"
colnames(NormandyUSA)[3]<-"Date"
colnames(NormandyUSA)[4]<-"Rating"
colnames(NormandyUSA)[5]<-"Full.Review"
NormandyUSA$Language <- rep(NA, nrow(NormandyUSA))
NormandyUSA$TripAdvisor <-rep(1, nrow(NormandyUSA))
MemoryDate <-(ymd("1944/06/08")-ymd("2015/01/01"))
NormandyUSA$MemoryDate <- rep(MemoryDate, nrow(NormandyUSA))
NormandyUSA$Experiencial <-rep(0, nrow(NormandyUSA))
NormandyUSA$Overt <- rep(0, nrow(NormandyUSA))
NormandyUSA$WalkAround <- rep(1,nrow(NormandyUSA))
NormandyUSA$Event <- rep(1,nrow(NormandyUSA))
NormandyUSA$Group <- rep(1,nrow(NormandyUSA))
NormandyUSA$Person <- rep(0,nrow(NormandyUSA))
NormandyUSA$ListNames <- rep(1,nrow(NormandyUSA))
NormandyUSA$MonumentName <- rep("Normandy American Cemetery and Memorial",nrow(NormandyUSA))
rm(MemoryDate)

###
#Nine Eleven
###
TA_nineeleven <- read.csv("TA_NineEleven.csv", header=TRUE, stringsAsFactors=FALSE)
TA_nineeleven <- TA_nineeleven[,c(-1,-2, -6, -7, -9)]
colnames(TA_nineeleven)[1]<-"Name"
colnames(TA_nineeleven)[2]<-"Top.Quote"
colnames(TA_nineeleven)[3]<-"Date"
colnames(TA_nineeleven)[4]<-"Rating"
colnames(TA_nineeleven)[5]<-"Full.Review"
TA_nineeleven$Language <- rep(NA, nrow(TA_nineeleven))
TA_nineeleven$TripAdvisor <-rep(1, nrow(TA_nineeleven))

YP_nineeleven <-read.csv("YP_NineEleven.csv", header=TRUE, na.strings=c("", "NA"), stringsAsFactors=FALSE)
YP_nineeleven <- na.omit(YP_nineeleven)
YP_nineeleven$Language <- as.factor(YP_nineeleven$Language)
YP_nineeleven$Top.Quote <- rep(NA, nrow(YP_nineeleven))
YP_nineeleven$TripAdvisor <- rep(0, nrow(YP_nineeleven))

NineEleven <- rbind(TA_nineeleven,YP_nineeleven)
MemoryDate <-(ymd("2001/09/11")-ymd("2015/01/01"))
NineEleven$MemoryDate <- rep(MemoryDate, nrow(NineEleven))
NineEleven$Experiencial <-rep(1, nrow(NineEleven))
NineEleven$Overt <- rep(0, nrow(NineEleven))
NineEleven$WalkAround <- rep(0,nrow(NineEleven))
NineEleven$Event <- rep(1,nrow(NineEleven))
NineEleven$Group <- rep(0,nrow(NineEleven))
NineEleven$Person <- rep(0,nrow(NineEleven))
NineEleven$ListNames <- rep(1,nrow(NineEleven))
NineEleven$MonumentName <- rep("National 9/11 NYC Memorial",nrow(NineEleven))
rm(YP_nineeleven, TA_nineeleven, MemoryDate)

###
#Oklahoma City
#Bombing occurs on April 19, 1995
###
TA_OklahomaCity <- read.csv("TA_OklahomaCity.csv", header=TRUE , stringsAsFactors=FALSE)
TA_OklahomaCity <- TA_OklahomaCity[,c(-1, -5, -6, -8)]
colnames(TA_OklahomaCity)[1]<-"Name"
colnames(TA_OklahomaCity)[2]<-"Top.Quote"
colnames(TA_OklahomaCity)[3]<-"Date"
colnames(TA_OklahomaCity)[4]<-"Rating"
colnames(TA_OklahomaCity)[5]<-"Full.Review"
TA_OklahomaCity$Language <- rep(NA, nrow(TA_OklahomaCity))
TA_OklahomaCity$TripAdvisor <-rep(1, nrow(TA_OklahomaCity))

YP_OklahomaCity <-read.csv("YP_OklahomaCity.csv", header=TRUE, na.strings=c("", "NA"), stringsAsFactors=FALSE)
YP_OklahomaCity <- na.omit(YP_OklahomaCity)
YP_OklahomaCity$Language <- as.factor(YP_OklahomaCity$Language)
YP_OklahomaCity$Top.Quote <- rep(NA, nrow(YP_OklahomaCity))
YP_OklahomaCity$TripAdvisor <- rep(0, nrow(YP_OklahomaCity))

OklahomaCity <- rbind(YP_OklahomaCity, TA_OklahomaCity)
MemoryDate <-(ymd("1995/04/19")-ymd("2015/01/01"))
OklahomaCity$MemoryDate <- rep(MemoryDate, nrow(OklahomaCity))
OklahomaCity$Experiencial <-rep(1, nrow(OklahomaCity))
OklahomaCity$Overt <- rep(0, nrow(OklahomaCity))
OklahomaCity$WalkAround <- rep(1,nrow(OklahomaCity))
OklahomaCity$Event <- rep(1,nrow(OklahomaCity))
OklahomaCity$Group <- rep(0,nrow(OklahomaCity))
OklahomaCity$Person <- rep(0,nrow(OklahomaCity))
OklahomaCity$ListNames <- rep(1,nrow(OklahomaCity))
OklahomaCity$MonumentName <- rep("Oklahoma City Bombing Memorial",nrow(OklahomaCity))
rm(YP_OklahomaCity,TA_OklahomaCity, MemoryDate)

###
# Pentagon
# 9/11
###
TA_Pentagon <- read.csv("TA_Pentagon.csv", header=TRUE , stringsAsFactors=FALSE)
TA_Pentagon <- TA_Pentagon[,c(-1, -5, -6, -8)]
colnames(TA_Pentagon)[1]<-"Name"
colnames(TA_Pentagon)[2]<-"Top.Quote"
colnames(TA_Pentagon)[3]<-"Date"
colnames(TA_Pentagon)[4]<-"Rating"
colnames(TA_Pentagon)[5]<-"Full.Review"
TA_Pentagon$Language <- rep(NA, nrow(TA_Pentagon))
TA_Pentagon$TripAdvisor <-rep(1, nrow(TA_Pentagon))

YP_Pentagon <-read.csv("YP_Pentagon.csv", header=TRUE, na.strings=c("", "NA"), stringsAsFactors=FALSE)
YP_Pentagon <- na.omit(YP_Pentagon)
YP_Pentagon$Language <- as.factor(YP_Pentagon$Language)
YP_Pentagon$Top.Quote <- rep(NA, nrow(YP_Pentagon))
YP_Pentagon$TripAdvisor <- rep(0, nrow(YP_Pentagon))

Pentagon <- rbind(YP_Pentagon, TA_Pentagon)
MemoryDate <-(ymd("2001/09/11")-ymd("2015/01/01"))
Pentagon$MemoryDate <- rep(MemoryDate, nrow(Pentagon))
Pentagon$Experiencial <-rep(1, nrow(Pentagon))
Pentagon$Overt <- rep(0, nrow(Pentagon))
Pentagon$WalkAround <- rep(1,nrow(Pentagon))
Pentagon$Event <- rep(1,nrow(Pentagon))
Pentagon$Group <- rep(0,nrow(Pentagon))
Pentagon$Person <- rep(0,nrow(Pentagon))
Pentagon$ListNames <- rep(1,nrow(Pentagon))
Pentagon$MonumentName <- rep("Pentagon 9/11 Memorial",nrow(Pentagon))
rm(YP_Pentagon,TA_Pentagon)

###
# Soviet War Memorial
###
TA_SovietWar <- read.csv("TA_SovietWar.csv", header=TRUE , stringsAsFactors=FALSE)
TA_SovietWar <- TA_SovietWar[,c(-1, -5, -6, -8)]
colnames(TA_SovietWar)[1]<-"Name"
colnames(TA_SovietWar)[2]<-"Top.Quote"
colnames(TA_SovietWar)[3]<-"Date"
colnames(TA_SovietWar)[4]<-"Rating"
colnames(TA_SovietWar)[5]<-"Full.Review"
TA_SovietWar$Language <- rep(NA, nrow(TA_SovietWar))
TA_SovietWar$TripAdvisor <-rep(1, nrow(TA_SovietWar))

YP_SovietWar <-read.csv("YP_SovietWar.csv", header=TRUE, na.strings=c("", "NA"), stringsAsFactors=FALSE)
YP_SovietWar <- na.omit(YP_SovietWar)
YP_SovietWar$Language <- as.factor(YP_SovietWar$Language)
YP_SovietWar$Top.Quote <- rep(NA, nrow(YP_SovietWar))
YP_SovietWar$TripAdvisor <- rep(0, nrow(YP_SovietWar))

SovietWar <- rbind(YP_SovietWar, TA_SovietWar)
MemoryDate <-(ymd("1945/05/08")-ymd("2015/01/01"))
SovietWar$MemoryDate <- rep(MemoryDate, nrow(SovietWar))
SovietWar$Experiencial <-rep(0, nrow(SovietWar))
SovietWar$Overt <- rep(1, nrow(SovietWar))
SovietWar$WalkAround <- rep(1,nrow(SovietWar))
SovietWar$Event <- rep(1,nrow(SovietWar))
SovietWar$Group <- rep(0,nrow(SovietWar))
SovietWar$Person <- rep(0,nrow(SovietWar))
SovietWar$ListNames <- rep(0,nrow(SovietWar))
SovietWar$MonumentName <- rep("Treptower Park",nrow(SovietWar))
rm(YP_SovietWar,TA_SovietWar, MemoryDate)

###
# Tomb of the Unknown Soldier
###
TA_TombUnknown <- read.csv("TA_TombUnknown.csv", header=TRUE , stringsAsFactors=FALSE)
TA_TombUnknown <- TA_TombUnknown[,c(-1, -5, -6, -8)]
colnames(TA_TombUnknown)[1]<-"Name"
colnames(TA_TombUnknown)[2]<-"Top.Quote"
colnames(TA_TombUnknown)[3]<-"Date"
colnames(TA_TombUnknown)[4]<-"Rating"
colnames(TA_TombUnknown)[5]<-"Full.Review"
TA_TombUnknown$Language <- rep(NA, nrow(TA_TombUnknown))
TA_TombUnknown$TripAdvisor <-rep(1, nrow(TA_TombUnknown))

YP_TombUnknown <-read.csv("YP_TombUnknown.csv", header=TRUE, na.strings=c("", "NA"), stringsAsFactors=FALSE)
YP_TombUnknown <- na.omit(YP_TombUnknown)
YP_TombUnknown$Language <- as.factor(YP_TombUnknown$Language)
YP_TombUnknown$Top.Quote <- rep(NA, nrow(YP_TombUnknown))
YP_TombUnknown$TripAdvisor <- rep(0, nrow(YP_TombUnknown))

TombUnknown <- rbind(YP_TombUnknown, TA_TombUnknown)
MemoryDate <-(ymd("1921/03/04")-ymd("2015/01/01"))
TombUnknown$MemoryDate <- rep(MemoryDate, nrow(TombUnknown))
TombUnknown$Experiencial <-rep(1, nrow(TombUnknown))
TombUnknown$Overt <- rep(1, nrow(TombUnknown))
TombUnknown$WalkAround <- rep(0,nrow(TombUnknown))
TombUnknown$Event <- rep(0,nrow(TombUnknown))
TombUnknown$Group <- rep(1,nrow(TombUnknown))
TombUnknown$Person <- rep(0,nrow(TombUnknown))
TombUnknown$ListNames <- rep(0,nrow(TombUnknown))
TombUnknown$MonumentName <- rep("Tomb of the Unknowns",nrow(TombUnknown))
rm(YP_TombUnknown,TA_TombUnknown, MemoryDate)

###
#Topography of Terror
###
TA_TopographyTerror <- read.csv("TA_TopographyTerror.csv", header=TRUE , stringsAsFactors=FALSE)
TA_TopographyTerror <- TA_TopographyTerror[,c(-1, -5, -6, -8)]
colnames(TA_TopographyTerror)[1]<-"Name"
colnames(TA_TopographyTerror)[2]<-"Top.Quote"
colnames(TA_TopographyTerror)[3]<-"Date"
colnames(TA_TopographyTerror)[4]<-"Rating"
colnames(TA_TopographyTerror)[5]<-"Full.Review"
TA_TopographyTerror$Language <- rep(NA, nrow(TA_TopographyTerror))
TA_TopographyTerror$TripAdvisor <-rep(1, nrow(TA_TopographyTerror))

YP_TopographyTerror <-read.csv("YP_TopographyTerror.csv", header=TRUE, na.strings=c("", "NA"), stringsAsFactors=FALSE)
YP_TopographyTerror <- na.omit(YP_TopographyTerror)
YP_TopographyTerror$Language <- as.factor(YP_TopographyTerror$Language)
YP_TopographyTerror$Top.Quote <- rep(NA, nrow(YP_TopographyTerror))
YP_TopographyTerror$TripAdvisor <- rep(0, nrow(YP_TopographyTerror))

TopographyTerror <- rbind(YP_TopographyTerror, TA_TopographyTerror)
MemoryDate <-(ymd("1933/01/30")-ymd("2015/01/01"))
TopographyTerror$MemoryDate <- rep(MemoryDate, nrow(TopographyTerror))
TopographyTerror$Experiencial <-rep(1, nrow(TopographyTerror))
TopographyTerror$Overt <- rep(0, nrow(TopographyTerror))
TopographyTerror$WalkAround <- rep(1,nrow(TopographyTerror))
TopographyTerror$Event <- rep(1,nrow(TopographyTerror))
TopographyTerror$Group <- rep(0,nrow(TopographyTerror))
TopographyTerror$Person <- rep(0,nrow(TopographyTerror))
TopographyTerror$ListNames <- rep(0,nrow(TopographyTerror))
TopographyTerror$MonumentName <- rep("The Topography of Terror",nrow(TopographyTerror))
rm(YP_TopographyTerror,TA_TopographyTerror, MemoryDate)

###
# U.S.S. Arizona
###
TA_UssArizona <- read.csv("TA_UssArizona.csv", header=TRUE , stringsAsFactors=FALSE)
TA_UssArizona <- TA_UssArizona[,c(-1, -5, -6, -8)]
colnames(TA_UssArizona)[1]<-"Name"
colnames(TA_UssArizona)[2]<-"Top.Quote"
colnames(TA_UssArizona)[3]<-"Date"
colnames(TA_UssArizona)[4]<-"Rating"
colnames(TA_UssArizona)[5]<-"Full.Review"
TA_UssArizona$Language <- rep(NA, nrow(TA_UssArizona))
TA_UssArizona$TripAdvisor <-rep(1, nrow(TA_UssArizona))

YP_UssArizona <-read.csv("YP_UssArizona.csv", header=TRUE, na.strings=c("", "NA"), stringsAsFactors=FALSE)
YP_UssArizona <- na.omit(YP_UssArizona)
YP_UssArizona$Language <- as.factor(YP_UssArizona$Language)
YP_UssArizona$Top.Quote <- rep(NA, nrow(YP_UssArizona))
YP_UssArizona$TripAdvisor <- rep(0, nrow(YP_UssArizona))

UssArizona <- rbind(YP_UssArizona, TA_UssArizona)
MemoryDate <-(ymd("1941/12/07")-ymd("2015/01/01"))
UssArizona$MemoryDate <- rep(MemoryDate, nrow(UssArizona))
UssArizona$Experiencial <-rep(0, nrow(UssArizona))
UssArizona$Overt <- rep(0, nrow(UssArizona))
UssArizona$WalkAround <- rep(0,nrow(UssArizona))
UssArizona$Event <- rep(1,nrow(UssArizona))
UssArizona$Group <- rep(0,nrow(UssArizona))
UssArizona$Person <- rep(0,nrow(UssArizona))
UssArizona$ListNames <- rep(1,nrow(UssArizona))
UssArizona$MonumentName <- rep("USS Arizona and Pearl Harbor Memorial",nrow(UssArizona))
rm(YP_UssArizona,TA_UssArizona, MemoryDate)

###
#Vietnam
###
TA_Vietnam <- read.csv("TA_Vietnam.csv", header=TRUE , stringsAsFactors=FALSE)
TA_Vietnam <- TA_Vietnam[,c(-1, -5, -6, -8)]
colnames(TA_Vietnam)[1]<-"Name"
colnames(TA_Vietnam)[2]<-"Top.Quote"
colnames(TA_Vietnam)[3]<-"Date"
colnames(TA_Vietnam)[4]<-"Rating"
colnames(TA_Vietnam)[5]<-"Full.Review"
TA_Vietnam$Language <- rep(NA, nrow(TA_Vietnam))
TA_Vietnam$TripAdvisor <-rep(1, nrow(TA_Vietnam))

YP_Vietnam <-read.csv("YP_Vietnam.csv", header=TRUE, na.strings=c("", "NA"), stringsAsFactors=FALSE)
YP_Vietnam <- na.omit(YP_Vietnam)
YP_Vietnam$Language <- as.factor(YP_Vietnam$Language)
YP_Vietnam$Top.Quote <- rep(NA, nrow(YP_Vietnam))
YP_Vietnam$TripAdvisor <- rep(0, nrow(YP_Vietnam))

Vietnam <- rbind(YP_Vietnam, TA_Vietnam)
MemoryDate <-(ymd("1955/11/01")-ymd("2015/01/01"))
Vietnam$MemoryDate <- rep(MemoryDate, nrow(Vietnam))
Vietnam$Experiencial <-rep(1, nrow(Vietnam))
Vietnam$Overt <- rep(0, nrow(Vietnam))
Vietnam$WalkAround <- rep(1,nrow(Vietnam))
Vietnam$Event <- rep(1,nrow(Vietnam))
Vietnam$Group <- rep(0,nrow(Vietnam))
Vietnam$Person <- rep(0,nrow(Vietnam))
Vietnam$ListNames <- rep(1,nrow(Vietnam))
Vietnam$MonumentName <- rep("Vietnam Veterans Memorial",nrow(Vietnam))
rm(YP_Vietnam,TA_Vietnam, MemoryDate)

###
#War Memorial of Korea
#December 1st, 1993 - Created
###
WarMemorialKorea <- read.csv("TA_warkorea.csv", header=TRUE , stringsAsFactors=FALSE)
WarMemorialKorea <- WarMemorialKorea[,c(-1, -5, -6, -8)]
colnames(WarMemorialKorea)[1]<-"Name"
colnames(WarMemorialKorea)[2]<-"Top.Quote"
colnames(WarMemorialKorea)[3]<-"Date"
colnames(WarMemorialKorea)[4]<-"Rating"
colnames(WarMemorialKorea)[5]<-"Full.Review"
WarMemorialKorea$Language <- rep(NA, nrow(WarMemorialKorea))
WarMemorialKorea$TripAdvisor <-rep(1, nrow(WarMemorialKorea))
MemoryDate <-(ymd("1993/01/01")-ymd("2015/01/01"))
WarMemorialKorea$MemoryDate <- rep(MemoryDate, nrow(WarMemorialKorea))
WarMemorialKorea$Experiencial <-rep(0, nrow(WarMemorialKorea))
WarMemorialKorea$Overt <- rep(1, nrow(WarMemorialKorea))
WarMemorialKorea$WalkAround <- rep(1,nrow(WarMemorialKorea))
WarMemorialKorea$Event <- rep(1,nrow(WarMemorialKorea))
WarMemorialKorea$Group <- rep(0,nrow(WarMemorialKorea))
WarMemorialKorea$Person <- rep(0,nrow(WarMemorialKorea))
WarMemorialKorea$ListNames <- rep(0,nrow(WarMemorialKorea))
WarMemorialKorea$MonumentName <- rep("War Memorial of Korea",nrow(WarMemorialKorea))
rm(MemoryDate)

###
#WWII
###
TA_WWII <- read.csv("TA_WWII.csv", header=TRUE , stringsAsFactors=FALSE)
TA_WWII <- TA_WWII[,c(-1, -5, -6, -8)]
colnames(TA_WWII)[1]<-"Name"
colnames(TA_WWII)[2]<-"Top.Quote"
colnames(TA_WWII)[3]<-"Date"
colnames(TA_WWII)[4]<-"Rating"
colnames(TA_WWII)[5]<-"Full.Review"
TA_WWII$Language <- rep(NA, nrow(TA_WWII))
TA_WWII$TripAdvisor <-rep(1, nrow(TA_WWII))

YP_WWII <-read.csv("YP_WWII.csv", header=TRUE, na.strings=c("", "NA"), stringsAsFactors=FALSE)
YP_WWII <- na.omit(YP_WWII)
YP_WWII$Language <- as.factor(YP_WWII$Language)
YP_WWII$Top.Quote <- rep(NA, nrow(YP_WWII))
YP_WWII$TripAdvisor <- rep(0, nrow(YP_WWII))

WWII <- rbind(YP_WWII, TA_WWII)
MemoryDate <-(ymd("1955/11/01")-ymd("2015/01/01"))
WWII$MemoryDate <- rep(MemoryDate, nrow(WWII))
WWII$Experiencial <-rep(0, nrow(WWII))
WWII$Overt <- rep(0, nrow(WWII))
WWII$WalkAround <- rep(1,nrow(WWII))
WWII$Event <- rep(1,nrow(WWII))
WWII$Group <- rep(0,nrow(WWII))
WWII$Person <- rep(0,nrow(WWII))
WWII$ListNames <- rep(0,nrow(WWII))
WWII$MonumentName <- rep("National World War II Memorial",nrow(WWII))
rm(YP_WWII,TA_WWII, MemoryDate)

###
#Yad Vashem
#January 30th, 1933 
###
YadVashem <- read.csv("TA_yadvashem.csv", header=TRUE , stringsAsFactors=FALSE)
YadVashem <- YadVashem[,c(-1, -5, -6, -8)]
colnames(YadVashem)[1]<-"Name"
colnames(YadVashem)[2]<-"Top.Quote"
colnames(YadVashem)[3]<-"Date"
colnames(YadVashem)[4]<-"Rating"
colnames(YadVashem)[5]<-"Full.Review"
YadVashem$Language <- rep(NA, nrow(YadVashem))
YadVashem$TripAdvisor <-rep(1, nrow(YadVashem))
MemoryDate <-(ymd("1933/01/30")-ymd("2015/01/01"))
YadVashem$MemoryDate <- rep(MemoryDate, nrow(YadVashem))
YadVashem$Experiencial <-rep(1, nrow(YadVashem))
YadVashem$Overt <- rep(1, nrow(YadVashem))
YadVashem$WalkAround <- rep(1,nrow(YadVashem))
YadVashem$Event <- rep(1,nrow(YadVashem))
YadVashem$Group <- rep(0,nrow(YadVashem))
YadVashem$Person <- rep(0,nrow(YadVashem))
YadVashem$ListNames <- rep(1,nrow(YadVashem))
YadVashem$MonumentName <- rep("Yad Vashem",nrow(YadVashem))
rm(MemoryDate)

FullList <- c(AirForceMemorial, Arlington, AustralianWar, BattleshipMissouri, BomberCommand, 
              ChiangKaiShek, CivilRights, CrazyHorse, DanubeShoes, DCWWI, FDR, HiroshimaPeace, 
              Jefferson, JewsBerlin, JohnLennon, Korean, Kranji, LincolnMemorial, MarineCorps, 
              MiamiHolocaust, Nanjing, NEHolocaust, NineEleven, NormandyUSA,
              OklahomaCity, Pentagon, SovietWar, TombUnknown, TopographyTerror, 
              UssArizona, Vietnam, WarMemorialKorea, WWII, YadVashem)
MemorialsFull <- rbind(AirForceMemorial, Arlington, AustralianWar, BattleshipMissouri, BomberCommand, 
                   ChiangKaiShek, CivilRights, CrazyHorse, DanubeShoes, DCWWI, FDR, HiroshimaPeace, 
                   Jefferson, JewsBerlin, JohnLennon, Korean, Kranji, LincolnMemorial, MarineCorps, 
                   MiamiHolocaust, Nanjing, NEHolocaust, NineEleven, NormandyUSA, 
                   OklahomaCity, Pentagon, SovietWar, TombUnknown, TopographyTerror, 
                   UssArizona, Vietnam, WarMemorialKorea, WWII, YadVashem)

MemorialsOld <-rbind(AirForceMemorial, Arlington, 
                     CivilRights, DCWWI, FDR, 
                     Jefferson, JewsBerlin, Korean, LincolnMemorial, MarineCorps, 
                    NineEleven, 
                     OklahomaCity, Pentagon, SovietWar, TombUnknown, TopographyTerror, 
                     UssArizona, Vietnam,  WWII)

setwd("/Users/kevincarriere/Desktop/BigDataProjects/TripAdvisor_Data")
write.csv(AustralianWar, "AustralianWar.csv")
write.csv(AirForceMemorial, "AirForceMemorial.csv")
write.csv(Arlington, "Arlington.csv")
write.csv(BattleshipMissouri, "BattleshipMissouri.csv")
write.csv(BomberCommand, "BomberCommand.csv")
write.csv(ChiangKaiShek, "ChiangKaiShek.csv")
write.csv(CivilRights, "CivilRights.csv")
write.csv(CrazyHorse, "CrazyHorse.csv")
write.csv(DanubeShoes, "DanubeShoes.csv")
write.csv(DCWWI, "DCWWI.csv")
write.csv(FDR, "FDR.csv")
write.csv(HiroshimaPeace, "HiroshimaPeace.csv")
write.csv(Jefferson, "Jefferson.csv")
write.csv(JewsBerlin, "JewsBerlin.csv")
write.csv(JohnLennon, "JohnLennon.csv")
write.csv(Korean, "Korean.csv")
write.csv(Kranji, "Kranji.csv")
write.csv(LincolnMemorial,"LincolnMemorial.csv")
write.csv(MarineCorps, "MarineCorps.csv")
write.csv(MiamiHolocaust, "MiamiHolocaust.csv")
write.csv(Nanjing, "Nanjing.csv")
write.csv(NEHolocaust, "NEHolocaust.csv")
write.csv(NineEleven, "NineEleven.csv")
write.csv(NormandyUSA, "NormandyUSA.csv")
write.csv(OklahomaCity, "OklahomaCity.csv")
write.csv(Pentagon, "Pentagon.csv")
write.csv(SovietWar, "SovietWar.csv")
write.csv(TombUnknown, "TombUnknown.csv")
write.csv(TopographyTerror, "TopographyTerror.csv")
write.csv(UssArizona, "UssArizona.csv")
write.csv(Vietnam, "Vietnam.csv")
write.csv(WarMemorialKorea, "WarMemorialKorea.csv")
write.csv(WWII, "WWII.csv")
write.csv(YadVashem, "YadVashem.csv")

write.csv(MemorialsOld, "MemorialsOld.csv")
write.csv(MemorialsFull, "MemorialsFull.csv")
rm(AirForceMemorial, Arlington, AustralianWar, BattleshipMissouri, BomberCommand, 
   ChiangKaiShek, CivilRights, CrazyHorse, DanubeShoes, DCWWI, FDR, HiroshimaPeace, 
   Jefferson, JewsBerlin, JohnLennon, Korean, Kranji, LincolnMemorial, MarineCorps, 
   MiamiHolocaust, Nanjing, NEHolocaust, NineEleven, NormandyUSA,
   OklahomaCity, Pentagon, SovietWar, TombUnknown, TopographyTerror, 
   UssArizona, Vietnam, WarMemorialKorea, WWII, YadVashem)


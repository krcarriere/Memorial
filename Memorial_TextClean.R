setwd("/Users/kevincarriere/Desktop/BigDataProjects/TripAdvisor_Data/")
MemorialDB <- read.csv("MemorialsFull.csv", header=TRUE, stringsAsFactors=FALSE)
MemorialDB$MonumentName <- as.factor(MemorialDB$MonumentName)
library(RWeka)
library(ngram)
library("tm")
library(stringr)
source("TripAdvisorFunctions.R")
Memorial.Text<-MemorialDB$Full.Review

AirForce <- subset(MemorialDB, MonumentName=="Air Force")
AirForceText <- clean.text(AirForce$Full.Review)
Arlington<- subset(MemorialDB, MonumentName=="Arlington Cemetary")
ArlingtonText <- clean.text(Arlington$Full.Review)
AustralianWar <- subset(MemorialDB, MonumentName=="Australian War Memorial")
AustralianWarText <- clean.text(AustralianWar$Full.Review)
BomberCommand <- subset(MemorialDB, MonumentName== "RAF Bomber Command Memorial")
BomberCommandText <- clean.text(BomberCommand$Full.Review)
Chiang <- subset(MemorialDB, MonumentName=="Chiang Kai-Shek Memorial Hall")
ChiangText <- clean.text(Chiang$Full.Review)
CrazyHorse <- subset(MemorialDB, MonumentName=="Crazy Horse Memorial")
CrazyHorseText <- clean.text(CrazyHorse$Full.Review)
CivilRights<- subset(MemorialDB, MonumentName=="Alabama Civil Rights Memorial")
CivilRightsText <- clean.text(CivilRights$Full.Review)
DCWWI<- subset(MemorialDB, MonumentName=="DC World War I Memorial")
DCWWIText<- clean.text(DCWWI$Full.Review)
FDR<- subset(MemorialDB, MonumentName=="Franklin Delanore Roosevelt Memorial")
FDRText <- clean.text(FDR$Full.Review)
HiroshimaPeace <- subset(MemorialDB, MonumentName=="Hiroshima Peace Memorial")
HiroshimaPeaceText <- clean.text(HiroshimaPeace$Full.Review)
Korean <-subset(MemorialDB, MonumentName=="Korean War Memorial")
KoreanText <- clean.text(Korean$Full.Review)
Kranji <- subset(MemorialDB, MonumentName=="Kranji War Memorial")
KranjiText <- clean.text(Kranji$Full.Review)
Jefferson <- subset(MemorialDB, MonumentName=="Thomas Jefferson Memorial")
JeffersonText <- clean.text(Jefferson$Full.Review)
JewsBerlin <- subset(MemorialDB, MonumentName=="Memorial to Murdered Jews of Europe")
JewsBerlinText <- clean.text(JewsBerlin$Full.Review)
MiamiHolocaust <- subset(MemorialDB, MonumentName=="Miami Holocaust Memorial")
MiamiHolocaustText <- clean.text(MiamiHolocaust$Full.Review)
NEHolocaust <- subset(MemorialDB, MonumentName == "New England Holocaust Memorial")
NEHolocaustText <- clean.text(NEHolocaust$Full.Review)
NormandyAmerican <- subset(MemorialDB, MonumentName =="Normandy American Cemetery and Memorial")
NormandyAmericanText <- clean.text(NormandyAmerican$Full.Review)
LincolnMemorial <- subset(MemorialDB, MonumentName=="Abraham Lincoln Memorial")
LincolnText <- clean.text(LincolnMemorial$Full.Review)
MarineCorps <- subset(MemorialDB, MonumentName=="US Marine Corps Memorial")
MarineCorpsText <- clean.text(MarineCorps$Full.Review)
NineEleven <- subset(MemorialDB, MonumentName=="National 9/11 NYC Memorial")
NineElevenText <- clean.text(NineEleven$Full.Review)
OklahomaCity <- subset(MemorialDB, MonumentName=="Oklahoma City Bombing Memorial")
OklahomaCityText <- clean.text(OklahomaCity$Full.Review)
Pentagon <- subset(MemorialDB, MonumentName=="Pentagon 9/11 Memorial")
PentagonText <- clean.text(Pentagon$Full.Review)
ShoesDanube <- subset(MemorialDB, MonumentName=="Shoes on the Danube Bank")
ShoesDanubeText <- clean.text(ShoesDanube$Full.Review)
JohnLennon <- subset(MemorialDB, MonumentName=="Strawyberry Fields - John Lennon Memorial")
JohnLennonText <- clean.text(JohnLennon$Full.Review)
Nanjing <- subset(MemorialDB, MonumentName=="The Memorial of the Nanjing Massacre")
NanjingText <- clean.text(Nanjing$Full.Review)
BattleshipMissouri <- subset(MemorialDB, MonumentName=="U.S.S. Missouri Battleship Memorial")
BattleshipMissouriText <- clean.text(BattleshipMissouri$Full.Review)
SovietWar <- subset(MemorialDB, MonumentName=="Treptower Park")
SovietWarText <- clean.text(SovietWar$Full.Review)
TombUnknown <- subset(MemorialDB, MonumentName=="Tomb of the Unknowns")
TombUnknownText <- clean.text(TombUnknown$Full.Review)
TopographyTerror <- subset(MemorialDB, MonumentName=="The Topography of Terror")
TopographyTerrorText <- clean.text(TopographyTerror$Full.Review)
UssArizona <- subset(MemorialDB, MonumentName=="USS Arizona and Pearl Harbor Memorial")
UssArizonaText <- clean.text(UssArizona$Full.Review)
Vietnam <- subset(MemorialDB, MonumentName=="Vietnam Veterans Memorial")
VietnamText <- clean.text(Vietnam$Full.Review)
WWII <- subset(MemorialDB, MonumentName=="National World War II Memorial")
WWIIText <- clean.text(WWII$Full.Review)
WarKorea <- subset(MemorialDB, MonumentName=="War Memorial of Korea")
WarKoreaText <- clean.text(WarKorea$Full.Review)
YadVashem <- subset(MemorialDB, MonumentName=="Yad Vashem")
YadVashemText <- clean.text(YadVashem$Full.Review)



rm(AirForce, Arlington, AustralianWar, BattleshipMissouri, BomberCommand, 
     Chiang, CivilRights, CrazyHorse, ShoesDanube, DCWWI, FDR, HiroshimaPeace, 
     Jefferson, JewsBerlin, JohnLennon, Korean, Kranji, LincolnMemorial, MarineCorps, 
     MiamiHolocaust, Nanjing, NEHolocaust, NineEleven, NormandyAmerican,
     OklahomaCity, Pentagon, SovietWar, TombUnknown, TopographyTerror, 
     UssArizona, Vietnam, WarKorea, WWII, YadVashem)
Full_List <- c(AirForceText, ArlingtonText, AustralianWarText, BattleshipMissouriText, BomberCommandText, 
               ChiangText, CivilRightsText, CrazyHorseText, ShoesDanubeText, DCWWIText, FDRText, HiroshimaPeaceText, 
               JeffersonText, JewsBerlinText, JohnLennonText, KoreanText, KranjiText, LincolnText, MarineCorpsText, 
               MiamiHolocaustText, NanjingText, NEHolocaustText, NineElevenText, NormandyAmericanText,
               OklahomaCityText, PentagonText, SovietWarText, TombUnknownText, TopographyTerrorText, 
               UssArizonaText, VietnamText, WarKoreaText, WWIIText, YadVashemText)


AirForce_Melted <- flip.bigramdataframe(AirForceText,"Air Force")
Arlington_Melted <- flip.bigramdataframe(ArlingtonText,"Arlington Cemetary")
AustralianWar_Melted <- flip.bigramdataframe(AustralianWarText, "Australian War Memorial")
BomberCommand_Melted <- flip.bigramdataframe(BomberCommandText,"RAF Bomber Command Memorial")
Chiang_Melted <- flip.bigramdataframe(ChiangText,"Chiang Kai-Shek Memorial Hall")
CrazyHorse_Melted <- flip.bigramdataframe(CrazyHorseText,"Crazy Horse Memorial")
CivilRights_Melted <- flip.bigramdataframe(CivilRightsText,"Alabama Civil Rights Memorial")
DCWWI_Melted<- flip.bigramdataframe(DCWWIText,"DC World War I Memorial")
FDR_Melted <- flip.bigramdataframe(FDRText,"Franklin Delanore Roosevelt Memorial")
HiroshimaPeace_Melted <- flip.bigramdataframe(HiroshimaPeaceText,"Hiroshima Peace Memorial")
Korean_Melted <- flip.bigramdataframe(KoreanText,"Korean War Memorial")
Kranji_Melted <- flip.bigramdataframe(KranjiText,"Kranji War Memorial")
Jefferson_Melted <- flip.bigramdataframe(JeffersonText,"Thomas Jefferson Memorial")
JewsBerlin_Melted <- flip.bigramdataframe(JewsBerlinText,"Memorial to Murdered Jews of Europe")
MiamiHolocaust_Melted <- flip.bigramdataframe(MiamiHolocaustText,"Miami Holocaust Memorial")
NEHolocaust_Melted <- flip.bigramdataframe(NEHolocaustText,"New England Holocaust Memorial")
NormandyAmerican_Melted <- flip.bigramdataframe(NormandyAmericanText,"Normandy American Cemetery and Memorial")
Lincoln_Melted <- flip.bigramdataframe(LincolnText,"Abraham Lincoln Memorial")
MarineCorps_Melted <- flip.bigramdataframe(MarineCorpsText,"US Marine Corps Memorial")
NineEleven_Melted <- flip.bigramdataframe(NineElevenText,"National 9/11 NYC Memorial")
OklahomaCity_Melted <- flip.bigramdataframe(OklahomaCityText,"Oklahoma City Bombing Memorial")
Pentagon_Melted <- flip.bigramdataframe(PentagonText,"Pentagon 9/11 Memorial")
ShoesDanube_Melted <- flip.bigramdataframe(ShoesDanubeText,"Shoes on the Danube Bank")
JohnLennon_Melted <- flip.bigramdataframe(JohnLennonText,"Strawyberry Fields - John Lennon Memorial")
Nanjing_Melted <- flip.bigramdataframe(NanjingText,"The Memorial of the Nanjing Massacre")
BattleshipMissouri_Melted <- flip.bigramdataframe(BattleshipMissouriText,"U.S.S. Missouri Battleship Memorial")
SovietWar_Melted <- flip.bigramdataframe(SovietWarText,"Treptower Park")
TombUnknown_Melted <- flip.bigramdataframe(TombUnknownText,"Tomb of the Unknowns")
TopographyTerror_Melted <- flip.bigramdataframe(TopographyTerrorText,"The Topography of Terror")
UssArizona_Melted <- flip.bigramdataframe(UssArizonaText,"USS Arizona and Pearl Harbor Memorial")
Vietnam_Melted <- flip.bigramdataframe(VietnamText,"Vietnam Veterans Memorial")
WWII_Melted <- flip.bigramdataframe(WWIIText,"National World War II Memorial")
WarKorea_Melted <- flip.bigramdataframe(WarKoreaText,"War Memorial of Korea")
YadVashem_Melted <- flip.bigramdataframe(YadVashemText,"Yad Vashem")

Full_List_Melted <- rbind.fill(AirForce_Melted, Arlington_Melted, AustralianWar_Melted, BattleshipMissouri_Melted, BomberCommand_Melted, 
               Chiang_Melted, CivilRights_Melted, CrazyHorse_Melted, ShoesDanube_Melted, DCWWI_Melted, FDR_Melted, HiroshimaPeace_Melted, 
               Jefferson_Melted, JewsBerlin_Melted, JohnLennon_Melted, Korean_Melted, Kranji_Melted, Lincoln_Melted, MarineCorps_Melted, 
               MiamiHolocaust_Melted, Nanjing_Melted, NEHolocaust_Melted, NineEleven_Melted, NormandyAmerican_Melted,
               OklahomaCity_Melted, Pentagon_Melted, SovietWar_Melted, TombUnknown_Melted, TopographyTerror_Melted, 
               UssArizona_Melted, Vietnam_Melted, WarKorea_Melted, WWII_Melted, YadVashem_Melted)

Small_Test_Melted <- rbind.fill(DCWWI_Melted, CivilRights_Melted, SovietWar_Melted)

Full <- Small_Test_Melted %>%
  group_by(MonumentName) %>%                               # for each dataset
  do(.[order(-.$value),][round(nrow(.)*0.9),]) %>%   # get the top 50% after ordering by value
  ungroup() %>%
  select(Bigram) %>%                                # keep the letters you found
  distinct() %>%                                     # keep distinct letters (avoid using a letter multiple times)
  inner_join(Small_Test_Melted, by="Bigram") %>%              # join back info from initial table
  dcast(MonumentName~Bigram, value.var="value")                              # reshape


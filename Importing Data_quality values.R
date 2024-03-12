#Okhtay Wahid Far 870485

#Lade das Paket und Datensatz
require(AER)
data("CPS1985")
attach(CPS1985)

#Arbeitsverzeichnis
setwd("D:\\MSSII")
getwd()

#Datei einlesen
miete03 <- read.csv2("D:/MSSII/miete03.csv")

#a) zwei stetige Merkmale
#Verteilung der Nettomiete in Bezug auf die Wohnflaeche
nm <- miete03$nm
wfl <- miete03$wfl
#Scatterplot
plot(nm, wfl)
#Regressionsgrade (y~x)
abline(lm(wfl~nm), col="red")

#b) zwei qualitative Merkmale
#Verteilung der Berufe in Bezug auf den Sektor
cps <- CPS1985

sec <- cps$sector
occ <- cps$occupation

cpstab <- table(sec, occ)
mosaicplot(cpstab)

#c) ein qualitatives, ein stetiges Merkmal
#(Stunden-)Lohnverteilung in Bezug auf die Ethnie
wage <- cps$wage
eth <- cps$ethnicity

cpstab1 <- table(wage,eth)
spineplot(wage, eth)

#d) ein binaeres, stetiges Merkmal
#(Stunden-)Lohnverteilung in Bezug auf das Geschlecht
gender <- cps$gender

boxplot(wage~gender, data=cps)

#Okhtay Wahid Far (870485)

setwd("D:\\MSSII")
getwd()
daten <- read.csv2("D:/MSSII/kredit.csv")
names(daten)
str(daten)
attach(daten)

lm1 <- lm(hoehe ~ laufzeit)
lm2 <- lm(hoehe ~ laufzeit + alter)
lm3 <- lm(hoehe ~ laufzeit + alter + beruf)

#Aufgabe 2A
plot(hoehe ~ laufzeit)
abline(lm1, col="red")

#Aufgabe 2B
summary(lm3)
#Estimate ist beta1 dach bzw. der Regressionskoeffizient
#um zu sehen, ob der Regressionskoeffizient signifikant ist, sehen wir uns den 
#t-Wert an, also wenn |t|>= 2, dann ist der Regressionskoeffizient auf einem Signifikationsniveau
# von 5% (alpha = 0,05) von 0 verschieden
#zB für laufzeit t=24,382 (ausgerechnet 138,421/5,677) -> 24,382>2 damit ist
#laufzeit signifikant von 0 verschieden -> Null-Hypothese getestet und verworfen
#genau das selbe gilt auch für berufleitend, also Null-Hypothese wird auch hier verworfen
#R²(Bestimmtheitsmaß) liegt bei 0,4443 (ist immer zwischen 0 & 1) umso näher an die 1 
# desto näher liegen die Werte auf der Gerade bzw. wahrscheinlicher ein linearer Zusammenhang

#Aufgabe 2C
#Man sieht sich R² an, um zu ermitteln, wie gut das Modell an die Daten angepasst ist 
#Je höher R², desto besser ist das Modell an die Daten angepasst

summary(lm1)
#bei lm1 ist R²=0,3906, also 39,06%

summary(lm2)
#bei lm2 ist R²=0,3937, 39,37%
#von Aufgabe 2B wissen wir, dass bei lm3 R²=0,4443 ist, also 44,43%
#-> lm3 ist das Modell, welches am besten an die Daten angepasst ist

#Aufgabe 2D
#mit der Varianzanalyse können wir überprüfen, welches der optimale Modell ist
anova(lm1,lm2)
anova(lm2,lm3)
anova(lm1,lm3)
#->lm3 ist von den 3 Modellen der bessere

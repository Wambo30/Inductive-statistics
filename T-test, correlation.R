## T-test, t-Verteilung, korrelation
#############################################################
##setwd("h:\\MSSI19")  ## ggf. Pfad setzen
miete <- read.csv2("miete03.csv")
miete.neu <- miete[miete$bj > 1980,]     ## Wohnungen neuer als 1980
attach(miete.neu)

dim(miete)
dim(miete.neu) ## jetzt n=378

## -- (a) ---
plot(wfl, nmqm)

cor(wfl, nmqm)       ## Korrelation (leicht negativ)
cor.test(wfl, nmqm)  ## Test auf Korrelation = 0, 
pWert <- cor.test(wfl, nmqm)$p.value; pWert ## nur pWert=0.01717

## -- (b) ---
cor.test(miete.neu$wfl, miete.neu$nmqm, alternative="less")
0.5*pWert ## hier, da Pruegroesse < 0 und t-Verteilung symmetrisch

cor.test(miete.neu$wfl, miete.neu$nmqm, alternative="greater")
1-0.5*pWert ## hier, da Pruegroesse < 0 und t-Verteilung symmetrisch

## -- (c) ---
lm <- lm(nmqm ~ wfl, data=miete.neu)
abline(lm, col="pink", lwd=4)
summary(lm)         ## gleicher pWert (zweiseitig) bei Test des Anstiegskoeff.
                    ## auf 0 und F-Test gegen das triviale (konstante) Modell

## Aufgabe 5
#######################################################

A <- c(501 , 502 , 499 , 498 , 499)  ## alte Waage
N <- c(499 , 499 , 499 , 500 , 497)  ## neue Waage

## Zweistichproben-t-Test, verbundene Stichproben
t.test(A,N, paired=TRUE)   ## p-Wert 0.3262 -> keine Ablehnung

## oder mit Einstichproben-t-Test, 
D <- A-N                   ## Differenzen => nur eine Stichprobe
t.test(D)

## oder ganz "per Hand"
d <- c(2, 3, 0, -2, 2)     ## Differenzen
m <- mean(d)
s <- sd(d)

q <- 2.776  ## aus Tabelle der t-Quantile bzw. qt(0.975,df=4)   
t <- abs ((m-0)*sqrt(length(d))/s )  ## 
t > q                                ## FALSE -> keine Ablehnung

## p-Wert gegenrechnen in R, n-1=4
2*(1-pt(t,4))

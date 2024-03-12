## Statistische Werte
##########################################################

library(AER)
data(CPS1985)
attach(CPS1985)

mx <- mean(education); mx
vx <- var(education); vx
sx <- sd(education); sx
n <- length(education); n

alpha <- 0.05
KI <- mx + c(-1,1)*qnorm(1-alpha/2)*sx/sqrt(n)
KI

## zum Vergleich (Achtung: R rechnet mit qt(1-alpha/2,n-1)
t.test(education)

KI <- mx + c(-1,1)*qt(1-alpha/2,n-1)*sx/sqrt(n)
KI

## Dichte und t-Test
##########################################################

##setwd("H:\\MSSI19")  ## hier ggf. Pfad zur Datei setzen
miete <- read.csv2("miete03.csv")
attach(miete)

altbau <- factor(bj <= 1949)
barplot(table(altbau))

f.altbau <- density(nmqm[altbau==TRUE])
f.neubau <- density(nmqm[altbau!=TRUE])

xlim <- range(f.altbau$x,f.neubau$x)  ## horizontale Skala fuer beide anpassen
ylim <- range(f.altbau$y,f.neubau$y)  ## vertikale Skala fuer beide anpassen

plot(f.altbau,lwd=2,main="Vergleich der Dichteschaetzungen (nmqm)",xlim=xlim,ylim=ylim)
rug(nmqm[altbau==TRUE])               ## Daten als rugplot
lines(f.neubau,col="red",lwd=2)
rug(nmqm[altbau!=TRUE],col="red")     ## Daten als rugplot
legend("topright",c("Altbau","Neubau"),col=c("black","red"),lwd=2)

t.test(nmqm ~ altbau, alternative="greater")
## "greater", da die Werte FALSE und TRUE
## sind, also Neubau (=FALSE) die erste Gruppe
## und Altbau (=TRUE) die zweite

## alternativ: die Gruppen direkt spezifizieren
t.test(nmqm[altbau==TRUE], nmqm[altbau!=TRUE], alternative="less")
## jetzt "less", denn die Gruppen sind nun
## andersherum

## Konfidenzintervalle
##########################################################

n <- c(40,400,4000); s <- 5; alpha <- 0.05

## Intervalle mit unterer Konfidenzgrenze
cbind( (n-1)*s^2/qchisq(1-alpha,n-1), rep(Inf,3) )

## Intervalle mit oberer Konfidenzgrenze
cbind( rep(0,3), (n-1)*s^2/qchisq(alpha,n-1) )

## Intervalle werden enger mit wachsendem n


## for Schleife für statistische Werte aus Matrix
##########################################################

mu <- 1; sig <- sqrt(2)  ## hier ggf. aendern
alpha <- 0.05            ## hier ggf. aendern

n <- 50
N <- 1000
x <- matrix(rnorm(n*N,mean=mu, sd=sig),N,n)

im.intervall <- rep(NA,N)  ## Anzahl wahres mu im KI

for (i in 1:N){
  x.i <- rnorm(n, mu, sig)  
  mittel <- mean(x.i)
  stabw <- sd(x.i)
  ki <- mittel + c(-1,1)*qt(1-alpha/2,n-1)*sd(x.i)/sqrt(n)
  im.intervall[i] <- (mu >=ki[1])&(mu <=ki[2])
}

print(sum(im.intervall))
print(mean(im.intervall))  ## Anteil wahres mu im KI
## (sollte ca. 1-alpha sein)




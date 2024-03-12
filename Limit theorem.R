
## Das R-Script vergleicht die geschaetzte Verteilung (Histogramm 
## und Dichteschaetzung) des Mittelwerts mit der Normalverteilung. 
## Wenn man den Stichprobenumfang n erhoeht, verbessert sich die 
## Approximation. Das funktioniert fuer egal welche Verteilung 
## (sofern die Voraussetzungen des Satzes erfuellt sind).
##################################################################

n <- 10        ## Stichprobenumfang (verschiedene ausprobieren!)

## Anzahl simulierter Stichproben
n.sim <- 100  

##################################################################
## Hier kann man die Verteilung auswaehlen:

## Stichprobe aus Exp(lambda)
####################################
lambda <- 2
x <- rexp(n*n.sim, rate=lambda)

## Stichprobe aus Bernoulli
####################################
##p <- 0.2
##x <- rbinom(n*n.sim, size=1, prob=p)

## Stichprobe aus Poisson
####################################
##lam <- 1
##x <- rpois(n*n.sim, lambda=lam)

##
##################################################################

x <- matrix(x, n, n.sim)  ## jede Spalte ist eine Stichprobe
dim(x)

s <- colSums(x)
s

mean(s)
var(s)
dens <- density(s)  ## Kerndichteschaetzung
dens.normal <- cbind(dens$x, dnorm(dens$x,mean=mean(s),sd=sd(s)) )
                    ## Normalverteilungsdichteschaetzung

ylim <- range(c(dens$y,dens.normal[,2])) ## Wertebereich fuer Plot
hist(s, freq=FALSE, border="blue",main="Datenverteilung (blau) vs. Normalverteilung (rot)")

lines(dens,col="blue",lwd=2)
lines(dens.normal, col="red",lwd=2)





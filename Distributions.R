## Aufgabe 1/1
#########################################

## Geometrische Verteilung (diskret)
####################################################
## unter Verwendung der Verteilung in R
## (in R: Erfolg wird nicht mitgezählt,
## in Formelsammlung: Erfolg wird mitgezählt)

p <- 0.5  ## Parameter (Erfolgswk.)
EX <- (1-p)/p; SigmaX <- sqrt((1-p)/p^2)

Min <- round(EX-2*SigmaX)
Max <- round(EX+3*SigmaX)
xlim <- c(Min,Max)
x <- seq(Min,Max,by=1)   ## x-Werte
par(mfrow=c(2,1))
plot(x, dgeom(x,p), type="h", lwd=3, col="blue", xlim=xlim, ylim=c(0,1), main="f(x)")
abline(v=EX,col="red")
abline(v=EX+SigmaX,col="orange")
abline(v=EX-SigmaX,col="orange")
plot(x, pgeom(x,p), type="s", lwd=2, col="blue", xlim=xlim, ylim=c(0,1), main="F(x)")
par(mfrow=c(1,1))

## Gleichverteilung (stetig)
####################################################

a <- -1  ## Parameter (untere Grenze)
b <-  1  ## Parameter (obere Grenze)
EX <- (a+b)/2; SigmaX <- sqrt((b-a)^2 /12)

Min <- round(EX-3*SigmaX)
Max <- round(EX+3*SigmaX)
x <- seq(Min,Max,length=200)   ## x-Werte
par(mfrow=c(2,1))
plot(x, dunif(x,a,b), type="l", lwd=2, col="blue",main="f(x)")
abline(v=EX,col="red")
abline(v=EX+SigmaX,col="orange")
abline(v=EX-SigmaX,col="orange")
plot(x, punif(x,a,b), type="l", col="blue",main="F(x)")
par(mfrow=c(1,1))

## Lognormalverteilung (stetig)
####################################################
## es ist log(X) ~ N(mu, sig^2)

mu <- 1     ## Parameter
sig <- 1   ## Parameter
EX <- exp(mu+0.5*sig^2); SigmaX <- sqrt( exp(2*mu+sig^2)*(exp(sig^2)-1) )

Min <- round(EX-2*SigmaX)
Max <- round(EX+3*SigmaX)
xlim <- c(Min,Max)
x <- seq(0,Max,length=200)   ## x-Werte
par(mfrow=c(2,1))
plot(x, dlnorm(x,mu,sig), type="l", lwd=2, col="blue", xlim=xlim, main="f(x)")
abline(v=EX,col="red")
abline(v=EX+SigmaX,col="orange")
abline(v=EX-SigmaX,col="orange")
plot(x, plnorm(x,mu,sig), type="l", col="blue", xlim=xlim, main="F(x)")
par(mfrow=c(1,1))

## Logistische Dichte
#################################################################

mein.f <- function(x, mu){
  f <- exp(-(x-mu))/(1+exp(-(x-mu)))^2
  return(f)
}

c(dlogis(1,5),mein.f(1,5))
c(dlogis(2,2),mein.f(2,2))

cbind(dlogis(-5:5,2),mein.f(-5:5,2))

mu <- -1
x <- seq(-7,7,0.1)  ## Gitter (x-Werte) fuer Funktionsgraph
plot(x, dlogis(x,mu),type="l",main="Logistische Dichte und Quantile")
q <- c(0.1,0.9)
##q <- c(0.05,0.95) ## alternative Werte zum Ausprobieren
points(qlogis(q,mu),c(0,0),pch=19, col="seagreen")
text(qlogis(q,mu),c(0,0), paste(q*100,"%",sep=""),pos=c(2,4),col="seagreen")
abline(v=qlogis(q,mu),col="seagreen",lty=2)

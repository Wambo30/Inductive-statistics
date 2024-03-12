
## Dichteschaetzung mit density
########################################################
setwd("h:\\MSSI15") ## Arbeitsverzeichnis setzen
miete <- read.csv2("miete03.csv")
attach(miete)

plot(density(nmqm[rooms==1]),main="Nettoquadratmetermieten")
lines(density(nmqm[rooms==2]),col="blue")
lines(density(nmqm[rooms==3]),col="green")
lines(density(nmqm[rooms==4]),col="orange")
lines(density(nmqm[rooms>=5]),col="red")
legend("topright",
       c("1-Zi.Whg","2-Zi.Whg","3-Zi.Whg","4-Zi.Whg","5-Zi.Whg und groesser"),
       col=c("black","blue","green","orange","red"),lwd=1)

## nichtparametrische Regressionsschaetzung mit locpoly
########################################################
require(AER)
data(CPS1985)
attach(CPS1985)

plot(experience, wage, pch="+", main="Lohn in Abhaengigkeit von Berufserfahrung")

lm <- lm( wage ~ experience )
abline(lm, col="darkorange", lwd=2)

require(KernSmooth)
bw <- 0.1*diff(range(experience))
lp <- locpoly(experience, wage, bandwidth=bw, degree=0)
lines(lp$x,lp$y, col="blue", lwd=3)

## verschiedene Bandweiten
bw2 <- c(0.01,0.05,0.2,0.5,1) *diff(range(experience))
col2 <- rainbow(length(bw2))

for (j in 1:length(bw2)){
  lp0 <- locpoly(experience,wage, bandwidth=bw2[j], degree=0)
  lines(lp0$x,lp0$y, col=col2[j])
}

legend("topright",c("lm",paste("locpoly",c(bw,bw2))),
       col=c("darkorange","blue",col2),lwd=c(2,3,rep(1,length(col2))))


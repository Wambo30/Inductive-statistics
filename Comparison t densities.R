## Vergleich der t-Dichten
#####################################################

x <- seq(-5,5,0.1)  ## Gitter fuer Funktionsgraphen
nn <- c(1,3,5,10,20,30)
anz <- length(nn)
cc <- rainbow(15)

plot(x, dnorm(x), type="l", lwd=3, col="green", main="Vergleich t- und N(0,1)-Dichten")
for (j in 1:anz){
  lines(x, dt(x,nn[j]), col=cc[j])
}
legend("topright",c("normal",paste("t (",nn,")",sep="")), lwd=c(3,rep(1,anz)), col=c("green",cc[1:anz]))
# Güte Funktion - Bootstrap

N <- 500  ## Anzahl Stichproben
n <- 15   ## Stichprobenumfang

mu0 <- 2  ## mu, auf das wir testen
          ## hier H1: mu > mu0

sigma <- sqrt(2)  ## wahres sigma
alpha <- 0.05     ## Signifikanzniveau

mu <- seq(mu0-sigma,mu0+sigma,length=50) ## Gitter fuer mu
z <- qnorm(1-alpha)                      ## kritischer Wert,
                                         ## ca. 1.65 bei alpha=5%

G.mu <- 1-pnorm(z-(mu-mu0)*sqrt(n)/sigma)
plot(mu,G.mu,type="l", main="Exakte und Bootstrap Guetefunktionen")
abline(h=alpha, col="red", lty=2)

G.approx <- G.t.approx <- rep(NA, length(mu)) ## simuliertes G initialisieren

for (k in 1:length(mu)){ ## Schleife ueber alle mu-Werte
  print(k) ## Fortschritt anzeigen 
  x <- matrix(rnorm(n*N,mean=mu[k],sd=sigma),N,n)   ## N Stichproben simulieren

  ## Test bei Normalverteilung, sigma bekannt
  Ablehnung <- (rowMeans(x)-mu0)*sqrt(n)/sigma > z  ## N Tests berechnen
  G.approx[k] <- mean(Ablehnung)                    ## Anteil Ablehnungen

  ## t-Test bei Normalverteilung, sigma unbekannt
  Ablehnung <- rep(NA,N)
  for(k.sim in 1:N){
    t.Test <- t.test(x[k.sim,],mu=mu0,alternative="greater")
                                                    ## N t-Tests berechnen
    Ablehnung[k.sim] <- t.Test$p.value <= alpha
  }
  G.t.approx[k] <- mean(Ablehnung)                  ## Anteil Ablehnungen
}
lines(mu,G.approx,col="blue")
lines(mu,G.t.approx,col="green")
legend("topleft",c("exakt","sigma bekannt","t-Test (sigma unbekannt)","alpha"),
       col=c("black","blue","green","red"),lty=c(1,1,1,2))

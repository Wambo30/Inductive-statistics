
## Das R-Script zeigt die Log-Likelihoodfunktion bei N(mu, sigma^2)
## und zeichnet die Maximum-Likelihood-Schaetzung ein. (Die Werte 
## n, mu, sigma koennen verändert werden.)
##################################################################


## Daten erzeugen
n <- 10; mu <- 1; sigma <- 0.5
x <- rnorm(n, mean=mu, sd=sigma)
mu
sigma^2

## Schaetzungen fuer mu und sigma^2
mu.hut <- mean(x)
mu.hut
sigma.hut <- sd(x)
sigma.hut^2

loglikfun <- function(mean,var){
  ll <- 0
  ## Funktion muss fuer Vektoren mean, var funktionieren,
  ## daher Schleife ueber Vektor x
  for (i in 1:length(x)){
    ll <- ll + log( dnorm(x[i],mean,sd=sqrt(var)) )
  }
  return(ll)
}

loglikfun(mu,sigma^2)
loglikfun(mu.hut,sigma.hut^2)

mu.grid <- seq(mu-sigma,mu+sigma,length=35)  ## an Daten angepasst
sigma2.grid <- seq(0.25*sigma^2,4*sigma^2,length=35)
ll <- outer(mu.grid, sigma2.grid, loglikfun)
ll <- replace(ll,ll==-Inf,NA)

## 2D Bilder
par(mfrow=c(1,2))
res <- persp(mu.grid, sigma2.grid, ll, theta = 30, phi = 30, expand = 0.5, col = "lightblue", axes=TRUE)

## ML-Schaetzung
mu.hut <- mean(x)
sigma2.hut <- var(x)*(n-1)/n
points(trans3d(mu, sigma^2, loglikfun(mu, sigma^2), pmat=res), pch=17, col="green")
points(trans3d(mu.hut, sigma2.hut, loglikfun(mu.hut, sigma2.hut), pmat=res), pch=19, col="red")
legend("topleft",c("wahrer Parameter","Schaetzung"),pch=c(17,19),col=c("green","red"))

contour(mu.grid, sigma2.grid, ll, nlevels=15,xlab="mu",ylab="sigma2")
points(mu, sigma^2, pch=17, col="green")
points(mu.hut, sigma2.hut, pch=19, col="red")
par(mfrow=c(1,1))

## 3D Bild
library(rgl)
persp3d(mu.grid, sigma2.grid, ll, col = "lightblue")
points3d(mu, sigma^2, loglikfun(mu, sigma^2), pch=17, col="green")
points3d(mu.hut, sigma2.hut, loglikfun(mu.hut, sigma2.hut), pch=19, col="red")

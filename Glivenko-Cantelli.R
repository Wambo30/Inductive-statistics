
## Das R-Script vergleicht die wahre (F) und die geschaetzte
## Verteilungsfunktion (F-hut). Wenn man den Stichprobenumfang 
## n erhoeht, verbessert sich die Approximation.
##################################################################

n <- 10
## Zufallszahlen aus N(mu,sigma^2)
x <- rnorm(n, mean=1, sd=2)
plot(ecdf(x),col="blue",main="F.hut (blau) vs. F (rot)")
x.grid <- seq(-7,7,length=50)
lines(x.grid, pnorm(x.grid, mean=1,sd=2), col="red")

n <- 10
## Zufallszahlen aus B(size,prob)
size <- 10
prob <- 0.2
x <- rbinom(n, size=size, prob=prob)
plot(ecdf(x),col="blue",main="F.hut (blau) vs. F (rot)")
x.grid <- 0:size
F <- stepfun(x.grid, c(0,pbinom(x.grid, size=size, prob=prob)))
lines(F, col="red",pch=19, verticals = FALSE)

n <- 10
## Zufallszahlen aus LN(mu,sigma^2)
meanlog <- 0
sdlog <- 1
x <- rlnorm(n, meanlog=meanlog, sdlog=sdlog)
plot(ecdf(x),col="blue",main="F.hut (blau) vs. F (rot)")
x.grid <- seq(-1,10,length=500)
lines(x.grid, plnorm(x.grid, meanlog=meanlog, sdlog=sdlog), col="red")


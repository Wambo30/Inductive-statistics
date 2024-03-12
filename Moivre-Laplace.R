## Moivre Laplace
####################################################

n <- 10
p <- 0.5
x <- 0:n  ## Werte der Verteilung

## exakte Binomial-Wahrscheinlichkeiten (in schwarz)
y <- pbinom(x, n , p)
plot(x,y,type="s",ylim=c(0,1)) 
points(x,y,pch=19) 

## Moivre-Laplace - ohne Korrektur (rot)
approx <- (x-n*p)/sqrt(n*p*(1-p))
y1 <- pnorm(approx)
points(x,y1,pch=19, col="red")

## Moivre-Laplace - mit Stetigkeitskorrektur (blau)
approx.stet <- (x+0.5-n*p)/sqrt(n*p*(1-p))
y1.stet <- pnorm(approx.stet)
points(x,y1.stet,pch=19, col="blue")
legend("topleft",c("exakt","ohne Korr.","mit Korr."),
       col=c("black","red","blue"),pch=c(NA,19,19),lwd=c(1,NA,NA))

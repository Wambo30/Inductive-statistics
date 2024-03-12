## kuenstliche Daten erzeugen
######################################################

set.seed(14122019)  ## immer dieselben Zufallszahlen

n <- 10        ## auf z.B. 100 erhoehen fuer bessere Genauigkeit
mu <- 0.19     ## auch probieren mit 0.19, 0.2
sigma <- 0.01
x <- rnorm(n, mu, sigma)
x <- round(x, digits=2); x; mean(x)


## Testen -- in der Praxis mit echten Daten!
######################################################

t.test(x, alternative="less", mu=0.2)
## wenn p-Wert <= alpha dann Ablehnung der H0

t <- (mean(x)-0.2)*sqrt(n)/sd(x); t
pWert <- pt(t, n-1); pWert

t.test(x, alternative="greater", mu=0.2)
pWert <- 1-pt(t, n-1); pWert

t.test(x, alternative="two.sided", mu=0.2)
t.test(x, mu=0.2) ## two.sided ist Standardwert
pWert <- 2*pt(t, n-1); pWert  ## diese Formel, da t<0


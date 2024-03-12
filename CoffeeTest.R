## kuenstliche Daten erzeugen
######################################################

set.seed(14122019)  ## immer dieselben Zufallszahlen

n <- 10        ## auf z.B. 100 erhoehen fuer bessere Genauigkeit
mu <- 0.195    ## auch probieren mit 0.19, 0.2
sigma <- 0.01
x <- rnorm(n, mu, sigma)
x <- round(x, digits=2); x; mean(x)


## Testen -- in der Praxis mit echten Daten!
######################################################

t.test(x, alternative="less", mu=0.2)
## wenn p-Wert <= alpha dann Ablehnung der H0

## Pruefgroesse bei bekanntem sigma
(mean(x)-0.2)*sqrt(n)/sigma
## t.test schaetzt sigma durch s
t <- (mean(x)-0.2)*sqrt(n)/sd(x); t
## p-Wert = "alpha" zu dem gerade noch abgelehnt wird
pt(t, df=n-1)

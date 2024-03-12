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

## zweiseitiger Test, sigma0=0.01 od. sigma0^2=0.0001, alpha = 0.05
(n-1)*var(x)/0.0001  ## Pruefgroesse
qchisq(0.025, n-1)   ## unterer kritischer Wert
qchisq(0.975, n-1)   ## oberer kritischer Wert
## keine Ablehnung, da Pruefgroesse > unterer kritischer Wert
## und < oberer kritischer Wert

## 95%-KI
(n-1)*var(x)*c( 1/qchisq(0.975, n-1) , 1/qchisq(0.025, n-1) )
var(x)

library(TeachingDemos)
sigma.test(x, sigma=0.01)
sigma.test(x, sigmasq=0.0001)




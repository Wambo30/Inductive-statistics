library(AER)
data(CPS1985)

X <- CPS1985$age
t.test(X)   ## Standard 95%-KI: [35.83647,37.83020]
t.test(X, conf.level = 0.90) ## [35.99719,37.66948]
t.test(X, conf.level = 0.99) ## [35.52151,38.14516]

## n fuer L=1 bestimmen (siehe SU), S bleibt
alpha <- 0.05
n.neu <- 4*qnorm(1-alpha/2)^2 *var(X); n.neu

qnorm(1-alpha/2)
qt(1-alpha/2,533)  ## ungefaehr gleich

####################################

Y <- CPS1985$married
table(Y)/sum(table(Y))
alpha <- 0.05
n <- length(Y)
p.hut <- mean(Y=="yes"); p.hut
L <- 2*qnorm(1-alpha/2)*sqrt(p.hut*(1-p.hut))/sqrt(n); L
## gewuenschte Laenge 1 Prozentpunkt
n.neu <- 4*qnorm(1-alpha/2)^2*(0.5*(1-0.5))/(0.01^2); n.neu
L <- 2*qnorm(1-alpha/2)*sqrt(p.hut*(1-p.hut))/sqrt(n.neu); L


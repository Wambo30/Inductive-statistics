## Binomial test
#####################################################

require(AER)
data(CPS1985)
attach(CPS1985)

par(mfrow=c(1,2))
barplot(table(gender),col=c("blue","red"))
barplot(table(union))
par(mfrow=c(1,1))

alpha <- 0.05
n <- length(gender)

## KI fuer gender
p.hut <- mean(gender=="female") 
KI <- c(p.hut-qnorm(1-alpha)*sqrt(p.hut*(1-p.hut))/sqrt(n),1)
KI <- c(p.hut-qt(1-alpha,n-1)*sqrt(p.hut*(1-p.hut))/sqrt(n),1)
KI

anz <- sum(gender=="female")
binom.test(anz,n, alternative="greater")
prop.test(anz,n, alternative="greater")

## KI fuer union
p.hut <- mean(union=="yes") 
KI <- c(p.hut-qnorm(1-alpha)*sqrt(p.hut*(1-p.hut))/sqrt(n),1)
KI <- c(p.hut-qt(1-alpha,n-1)*sqrt(p.hut*(1-p.hut))/sqrt(n),1)
KI

anz <- sum(union=="yes")
binom.test(anz,n, alternative="greater")
prop.test(anz,n, alternative="greater")

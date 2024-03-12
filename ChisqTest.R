
## Erzeugen einer diskreten Gleichverteilung
n <- 200
x <- sample(1:6, n, replace=TRUE)
table(x)
barplot(table(x))

## Chi^2-Anpassungstest
chisq.test(table(x))
chisq.test(table(x), p=rep(1/6,6))

## Erzeugen einer "falschen" diskreten Gleichverteilung
n <- 200
xx <- sample(1:6, n, replace=TRUE)
xx[((1:n)%%2==0) & xx==6] <- 5  ## falscher Wuerfel, zeigt oefter 5 statt 6
table(xx)
barplot(table(xx))

## Chi^2-Anpassungstest
chisq.test(table(xx))


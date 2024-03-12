# Okhtay Wahid Far (870485)

#Aufgabe 2c
#mit rlogis werden Zufallszahlen erzeugt, ausgewählt n=500000, location=0, scale=1

#Berechnung des Erwartungswertes (was 0 sein soll)
x <- mean(rlogis(500000, 0, scale =  1))

#Berechnung der Varianz (was pi^2/3 sein soll (pi^2/3 bei z sichtbar))
y <- var(rlogis(500000, 0, scale = 1))
z <- pi^2/3

#Aufgabe 3
#Dichtefunktion, die wir in AUfgabe 2b ausgerechnet haben
f <- function(x){
  a <- (exp(x))/(1+exp(x))^2
  return(a)
}

#Verteilungsfuntion der standard-logistischen Verteilung
F <- function(x){
  b <- 1/(1+exp(-x))
  return(b)
}

#Dichtefunktion der Standardnormalverteilung
fx <- dnorm(x)

#Verteilungsfunktion der Standardnormalverteilung
Fx <- pnorm(x)

#Datensequenz erstellt
x <- seq(from=-10, to=10, length=100)
#damit die plots nebeneinander zu sehen sind
par(mfrow=c(1,2))
#plot von der Dichtefkt. der standard-logistischen Verteilung
#& mit lines im selben plot die Dichtefkt.der Standardnormalverteilung
plot(f(x), pch=20, col="hotpink")
lines(fx, pch=20, col="coral")

#plot der Verteilungsfkt der standard-logistischen Verteilung
#&  mit lines im selben plot die Verteilungsfkt.der Standardnormalverteilung
plot(F(x), pch=20, col="palegreen")
lines(Fx, pch=20, col="purple")

#wir sehen keine gravierenden Unterschiede



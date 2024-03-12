## P-Wert , kritischer Wert
############################

x <- c(1.45, 0.76, 0.96, 1.53, 0.93, 0.85, 1.35, 0.50, 0.80, 1.82, 1.60, 1.30)
y <- c(1.39, 0.77, 0.95, 1.51, 0.90, 0.83, 1.30, 0.49, 0.82, 1.73, 1.54, 1.21)
## verbundene Stichproben 
## Hilfe zum t-Test in R: ?t.test

t.test(x,y, paired=TRUE) ## Standard: zweiseitig
t.test(x,y, paired=TRUE, alternative="two.sided")

## alternative  => einseitig oder zweiseitig
## mu           => haben wir einen "Sollwert"? (Folie delta0)
## paired       => TRUE fuer verbundene Stichproben
## var.equal    => TRUE fuer gleiche Varianzen
## conf.level   => Wk. für KI einstellen

## Ergebnis: p-value = 0.007287
## wir lehnen die Hypothese H0 ab (zu alpha=5%, auch noch zu 1%)
## die Messmethoden sind signifikant unterschiedlich!

x.quer <- mean(x); x.quer
y.quer <- mean(y); y.quer
x.quer-y.quer

n <- length(x)
s.D <- sqrt( sum( (x-y -(x.quer-y.quer))^2 )/(n-1) ); s.D
sd(x-y) ## zum Vergleich


## Pruefgroesse : 
t <- (x.quer-y.quer)*sqrt(n)/s.D
t
## kritischer Wert: t_(n-1),1-alpha/2
alpha <- 0.01
t.alpha <- qt(1-alpha/2, df=n-1)
t.alpha
## Ablehnung, falls |t| > t.alpha 
abs(t) > t.alpha
## ja Ablehnung, egal ob alpha =5%, 1%, 10%

## p-Wert 
2*pt(-abs(t),df=n-1)
2*(1-pt(abs(t),df=n-1))

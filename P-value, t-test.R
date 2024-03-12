## P-Wert
############################

x <- c(5.5, 6.0, 8.0, 6.0, 7.5, 6.0, 5.5, 5.5, 11.0, 6.5)
y <- c(6.5, 6.0, 8.5, 7.0, 6.5, 8.0, 7.5, 6.5, 7.5, 6.0, 8.5, 7.0)
## nicht-verbundene Stichproben, ungleiche Varianzen => Folie 64
## Hilfe zum t-Test in R: ?t.test

t.test(x,y, alternative="less")

## alternative  => einseitig oder zweiseitig
## mu           => haben wir einen "Sollwert"? (Folie delta0)
## paired       => TRUE fuer verbundene Stichproben
## var.equal    => TRUE fuer gleiche Varianzen
## conf.level   => Wk. für KI einstellen

## Ergebnis: p-value = 0.2716
## wir lehnen die Hypothese H0 nicht ab (zu alpha=5%)
## obwohl Mittelwert von x kleiner als der von y
## haben wir kein signifikantes Resultat fuer alpha=0.05=5%

x.quer <- mean(x); x.quer
y.quer <- mean(y); y.quer
s.x <- sd(x); s.x
s.y <- sd(y); s.y  ## anders als auf Uebungsblatt?

n <- length(x); m <- length(y)
s.D <- sqrt( var(x)/n + var(y)/m)
k <- (s.D^4)/( (var(x)/n)^2 /(n-1) + (var(y)/m)^2 /(m-1) ); k

## Pruefgroesse: 
t <- (x.quer-y.quer)/s.D
t
## kritischer Wert: t_k,alpha
alpha <- 0.05
t.alpha <- qt(alpha, df=k)
t.alpha
## Ablehnung, falls t < t.alpha 
## hier nicht der Fall, egal ob alpha =5%, 1%, 10%

## p-Wert (siehe Tafelbild)
pt(t,df=k)

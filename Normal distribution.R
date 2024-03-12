#aufgabenblatt 11 
#aufg 1)wahrscheinlichkeit normalverteilung

pnorm(0) # ausgabe= 0.5
pnorm(0.5) # ausgabe = 0.6914625
pnorm(1) # ausgabe= 0.8413447
1-pnorm(1) # ausgabe= 0.1586553
pnorm(-1) == 1-pnorm(1) # ausgabe= 0.1586553
pnorm(1) - (1- pnorm(1)) # ausgabe = 0.6826895
pnorm(1) - pnorm(0) # ausgabe = 0.3413447

qt(0.975,9) 
'#bestimung endgültigen t wert statt in tabelle für quantile der t-verteilung zu
schauen
wir nutzten: t0=1-[(1-alpha)/2]=0.975 und n-1=10-1=9


#' 

#aufgabe4)a)
qt(0.975,64)
# R-Test 

load("~/EStat/R-Studio/RTest.Rda")

Datenladen(870485)


#aufg1
table(Lohn)
Lohn

#1a) (Befehl und Ausgabe) Erstellen Sie eine Häufigkeitstabelle der 
#Variable weiblich aus dem Datensatz Lohn.

table(Lohn$weiblich)

#1b) Befehl und Ausgabe) Bestimmen Sie Mittelwert, Median, Varianz, 
#Standardabweichung und Quartilabstand der Variable StdLohn (5 Befehle).

#median
median(Lohn$StdLohn)
#ausgabe: 11.433

#mittelwert
mean(Lohn$StdLohn)
#ausgabe: 13.69526

#varianz
var(Lohn$StdLohn)
#ausgabe: 44.55994

#quartilsabstand
IQR(Lohn$StdLohn)
#ausgabe:6.1605


#standardabweichung
sd(Lohn$StdLohn)
#ausgabe:6.675323


#1c)
table(Lohn$Kinder)


#1d)
barplot(Lohn$Kinder)


#1e)

boxplot(Lohn$StdLohn, horizontal ="TRUE", main ="Std-Lohn", col="green" )

#1f)
'#
Es gibts viele ausreißer. Das 3.Quantil ist eher unter dem mittelwert
aller stundenlöhne dh 75% der leute haben einen stundenlohn unter
dem Durchschnittsstundenlohn. Zudem gibts einen großen Abstand
zum höchsten Stundenlohn. Viele Stundenlöhne sind Ausreißer also
die Verhältnisse sind ungerecht.


#'

#1g)


#-----------------------------------------------------------------

#aufgabe2

#2a)(Befehl) Stellen Sie Stundenlohn (y-Achse) gegen Bildungsjahr (x-Achse) in einem Streudiagramm
#dar.
plot(Lohn$StdLohn,Lohn$Bildung)


#2b)

lm.obj1<-lm(Lohn$StdLohn~Lohn$Bildung)


#2c)regressionskoeffizienten ablesen

summary(lm.obj1)

#2d) 
#durch ablesen an der summary tabelle

f(x)= 1.96 + 0.93*x


#2e)(Befehl und Ausgabe) Geben Sie einen arithmetischen Befehl ein, 
#der den Prognosewert bei 13 Bildungsjahre berechnet.


ergebnis<- 1.96+ 0.93*13
ergebnis
#ausgabe: 14.05


#2f) (Befehl) Entwerfen Sie eine kurze R-Funktion namens prognose mit Argument x, die f(x)
#als Rückgabewert ausgibt.
prognose<- 1.96+ 0.93*x


#2g) (Befehl) Überprüfen Sie Ihre Funktion mit dem Prognosewert 
#bei 13 Bildungsjahre.

prognose<- 1.96+ 0.93*13
prognose
#ausgabe: 14.05 also ist identisch mit prognosewert von 2e)
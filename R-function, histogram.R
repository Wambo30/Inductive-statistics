#übungsblatt 3, r-funktion, histogramm, verteilungsfunktion

# Aufg 1) klassierte Daten und histogramme

#1a)  Erzeugen Sie ein Objekt mit den Butterpreisen
Butter<- c(1.30, 1.65, 1.80, 1.90, 1.99, 2.18, 2.25, 2.39, 2.49, 2.60, 2.69, 2.75, 2.75, 2.80, 2.95, 2.99)

# alle butterpreise werden in einem vektor gespeichert und einer
#variablen zugewiesen


#1b)Bestimmen Sie den Mittelwert der Preise
mean(Butter)
#ausgabe: 2.3425 ==> passt auch zu dem schriftlich berechneten wert


#1c)Bestimmen Sie den Median der Preise
median(Butter)
#ausgabe: 2.44 ==> passt auch zu dem schriftlich berechneten wert


#1d)Bilden Sie die klassierten Butterpreise mit den gleichen 
#Grenzen wie im Aufgabenblatt

Intervalldaten<- cut(Butter,breaks=c(1,1.5,2,2.5,3),right=FALSE)
table(Intervalldaten)
# right= false ==> damit es rechts eine offene grenze hat und nicht
# geschlossen



#1e) Alle Intervalle haben Breite 0.5, was macht die Berechnung der
#Säulenhöhen des Histogrammseinfacher:
n <- length(Butter) # bestimmung stiprobenumfang
table(Intervalldaten)/(0.5*n)


#1f)Erzeugen Sie ein Histogramm der Butterpreise:
hist(Butter,breaks=c(1,1.5,2,2.5,3),freq=FALSE)
# freq = FALSE ==> bestimmt abstand der y-achse in 0.4 schritten
#breaks ==> ist nicht hinreichend da auch ohne breaks dasselbe hist
#rauskommt

#-------------------------------------------------------------------

#aufgabe 2)


#2a)
rbinom(10,5,0.5)
#alle Zahlen stammen aus die Menge{0,1,2,3,4,5}.Der Befehl generiert 
#10 zufällige Zahlen, die zu einer Binomialverteilung mit 
#Parametern n=5 und p=0.5 passen:X???B(5,0.5).Die Werte von rbinom 
#sind zufällige Zahlen und sind jedes Mal anders.


#2b)
set.seed(100)
rbinom(10,5,0.5)
# ausgabe: 2 2 3 1 2 2 3 2 3 1 ==> auch nach mehrmaligen ausführen
# bleiben die zahlen gleich! die ändern sich nicht

#regel- set.seed(<NatürlZahl>) ==> egal welcher wert drin steht
# dadurch bleiben die zufälligen zahlen IMMER gleich!


#2c) X???B(5,0.5)passt zum Zufallsexperiment also 
# "X ist die Anzahl der Köpfe nach fünf Münzwürfen 
#Die Wahrscheinlichkeiten lassen sich aus der Funktion dbinom() 
#ergeben.Die Wahrscheinlichkeit, dass Kopf genau 3-Mal bei 5 
# Münzwürfen auftritt, ist:

dbinom(3,5,0.5)
#ausgabe: 0.3125 ==> auch nach mehrmaligen ausführen selbes ergebnis


#2d)Die Verteilungsfunktion lasst sich mit der Funktion pbinom() 
#bestimmen.Die Wahrscheinlichkeit, dass Kopf höchstens 3-Mal bei 
# 5 Münzwürfen auftritt, ist: 
pbinom(3,5,0.5)



#2e)Benutzen Sie R-Befehle um  die  folgenden  Fragen  zu  antworten:
#Eine  Münze  wird  viermal geworfen. Wie groß ist die 
#Wahrscheinlichkeit, dass Kopf genau 2-mal auftritt? Wie groß ist 
#die Wahrscheinlichkeit, dass Kopf höchstens 2-mal auftritt?




#2f)Simulieren Sie eine Stichprobe von einhundert B(5,0.5)-Verteilte 
# Zufallszahlen, und speichern Sie das ergebnis in einem Objekt 
#namens x100.
# Code dazu: x100<-rbinom(???,???,???)
#Die absolute Häufigkeiten Ihre Stichprobe ist:
# code dazu: table(x100)
#Ein Säulendiagramm der Stichprobe ist:
#code dazu: barplot(table(x100))


#-------------------------------------------------------------------

#aufgabe 3) Verteilungen und Zufallsvariablen: 
#Normalverteilung Sei X eine Normalverteilte  Zufallsvariable 
#X???N(0,1).  Die  Normalverteilung  ist  eine  stetige Verteilung.

#3a)Erzeugen Sie sich mittels der R-Funktionen rnorm einen Vektor 
#von 10 standardnormalverteilten Zufallszahlen:
rnorm(10)

#ausgabe:
#[1]  0.6026048 -0.4190084  0.6195799 -1.1799420 -1.0442828  0.6572379
#[7]  0.3756398  0.4659933  0.3470856  1.0888477

#dh nach jeder nochmaligen ausführung kriegt man 10 andere 
#zufallszahlen. das sind zufallszahlen für die stdnormalverteilung



#3b)Erzeugen Sie nun einen Vektor von 1000 standardnormalverteilten 
#Zufallszahlen und speichern Sie das Ergebnis in einem Objekt 
#namens xnorm1000:
xnorm1000<-rnorm(1000)

#regel rnorim(<natürlZahl>) == generiert zufallszahlen für die std
#normalverteilung dh natürlichZahl=120 => 120 generierte 
#Zufallszahlen für stdnormalverteilung



#3c)Berechnen Sie den Mittelwert und den Median von xnorm100.
#Welche Werte erwarten Sie?

mean(xnorm1000)
#ausgabe: 0.01717412

median(xnorm1000)
#ausgabe: 0.03030895


#==> da wir mit werten arbeiten egal ob diskret oder stetig
# kann man immer mit mittelwert und modus arbeiten


#3d)Erstellen Sie ein Histogramm der Stichprobe xnorm100. 
#Fügen Sie die theoretische Dichtefunktion der 
#Standardnormalverteilung dem Histogramm hinzu:
hist(xnorm1000,freq=FALSE)
curve(dnorm, from=-3, to=3,add=TRUE)

'# regel- kurvenbildung über histogramm

syntax: curve(dnorm, from=<kleinsteElementXachse>, to=<größteElementXachse>,add=TRUE)

==> es muss auch nicht unbedingt das kleinste bzw. größte element
sein! die kurve erstreckt sich nur von der einen zur anderen grenze
und zeichnet einfach das histogramm als kurve nach!


#'


#3e)Erzeugen Sie einen Vektor von 1000 Normalverteilten Zufallszahlen,
#mit Erwartungswert 50 und Standardabweichung 5. Speichern Sie das 
#Ergebnis in einem Objekt namens ynorm1000:
ynorm1000<-rnorm(1000,50,5)
hist(ynorm1000,freq=FALSE)


#Erzeugen Sie ein Histogramm für ynorm1000. Bemerken Sie dass die 
#Form des Histogramms ist ähnlich aber die x-Achse ist anders.

#==> x achse ist 5 schritten abständen von 35 bis 70. Da 50 der 
#erwartungswert ist existieren um 50 herum die meisten absol. 
#häufigkeiten


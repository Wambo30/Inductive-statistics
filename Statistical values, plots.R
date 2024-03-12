#übungsblatt 5, statistische Werte, plots

#blatt 5 aufg1)
# Wir bearbeiten aufg 2 von blatt 4 

# 1a)Bestimmen Sie den Mittelwert, Median. Spannweite und Quartilabstand 
#der Daten.

# daten einbetten durch vektor
bedienzeiten<- c(0.11, 0.23, 0.30, 0.40, 0.89, 0.9, 1.1, 1.16, 1.94, 2.3, 2.91, 3.21, 3.47, 4.2, 4.35, 5.09, 5.28, 6.06, 6.20, 7.9)
table(bedienzeiten)

mean(bedienzeiten)
#ausgabe: 2.9

median(bedienzeiten)
#ausgabe: 2.605

'# regel- spannweite bestimmen
range (<NameDatensatz>) ==> ausgabe: max min 
( also maximal -und minimalwert werden ausgegeben)

diff(range(<NameDatensatz>)) == Spannweite R == maxWert - minWert

#'

diff(range(bedienzeiten))
# ausgabe: 7.79


'# regel- quartilabstand bestimmen:
IQR(<NameDatensatz>) == <WertQuartilabstand>
#'

IQR(bedienzeiten)
#ausgabe: 3.6375


#1b)Stellen Sie die Bedienzeiten in einem Boxplot dar. 
# Der 2. Befehl hat zusätzliche Argumente, diedas Diagramm verzieren.
boxplot(bedienzeiten)
boxplot(bedienzeiten, horizontal ="TRUE", main ="Verteilung Bedienzeiten", col="green", xlab="Bedienzeit (in Minuten)", cex.lab="0.7", ylab="Werte", cex.axis=2.5)


'# regel- boxplot erstellen
syntax: boxplot(<NameDatensatz>, main="NameUeberschrift", col="NameFarbe", xlab="BeschriftungXachse",
ylab="BeschriftungYachse", )

horizontal ="TRUE" => boxplot steht horizontal aber OHNE werte also
nackter boxplot

cex.lab = 1.5 => schriftgröße x achsen titel wobei stanni bei 1 ist

cex.axis = 1.5 => schriftgröße von y-achse wobei 1 standard ist.Danach 1.5
oder auch kleiner
#'



'# 1c)Erstellen Sie die Empirische Verteilungsfunktion der 
Bedienzeiten.Bemerkungen:
.Die Funktion ecdf()berechnet die relevante Information. 
Der Funktionname stammt aus Englisch "empirical cumulative distribution function". 
Die Ausgabe ist dann zur Funktion plot() übergaben.
. Eine  andere  Gestalt  des  Diagramms  ist  durch  die  
Argumente verticals=TRUE und do.points=F erstellt
#'

plot(ecdf(bedienzeiten))
#ausgabe: grafik also treppenfkt um verteilungsfkt darzustellen

plot(ecdf(bedienzeiten),main="EVF von Bedienzeiten")
plot(ecdf(bedienzeiten),main="EVF von Bedienzeiten",do.points=F)
plot(ecdf(bedienzeiten),main="EVF von Bedienzeiten",verticals=TRUE,do.points=F)


'# befehle
do.points= F ==> punkte bei treppenfkt die jede einzelne treppe 
anfangs hat, fällt weg

verticals=TRUE ==> treppen werden miteinander mit vertikalten
strichen verbunden
#'

hist(bedienzeiten)
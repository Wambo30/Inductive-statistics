#Übung1 Downie 

# Regel- befehlausführung von zeile in R-Skript
# befehlszeile markieren und  Strg+ Enter drucken => ergebnis steht im 
# umgebungsfenster rechts

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
'#
regel: vektor einer variable zuweisen

- vektor bildung erfolgt IMMER mit dem namen c 
==> ist SEHR komisch aber ist so

bsp obda: 
x <- c(1,3)
ausgabe: 1 3

x <- e(1,3)
==> fehlermeldung da man es nur mit c machen kann

#'
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#regel: zahlenfolge einer variable zuweisen

#a3<- 4:12
#ausgabe a3 == 4 5 6 7 8 9 10 11 12
#==> dh alle zahlen werden darin gespeichert!

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#regel: zahlenfolge von geraden zahlen

#bsp obda:

#seq(0,10,by=2)
#ausgabe: 0 2 4 6 8 10

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# regel: ln von zahl bestimmen

#bsp obda: sollen ln von 3 bestimmen also log von 3 zur basis e

# log ( 3, base= exp(1) )
# ausgabe: 1.098612

# warum? da exp(1) == e^1 gilt also e hoch 1 

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# regel- mittelwert bestimmen

#variante 1:
#mean(1:10) 
# ausgabe: 5.5
# dh folge von 1 bis 10  wird aufaddiert und DANN durch anzahl der 
# zahlen geteilt also 10 ==> mittelwert von 1 bis 10 bestimmt


# variante 2:
# sum (1:10) / 10
# ausgabe: 5.5
# dh ist dasselbe wie oben BLOß das die tatsächlichen befehle genutzt
#werden die man normalerweise dafür nutzen würde!!!

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
'#
regel: vektoraddition und vektormultiplik mit zwei verschieden großen 
vektoren

Wenn die Anzahl der Elemente in zwei Vektoren ungleich sind, wird der 
kürzere Vektor wiederholt,damit er die gleiche Länge als der längere Vektor 
ist. 
Dieses Verfahren heißt Vektorrecycling.

==> dh der vektor wird mit seinen eigenen werten in der selben reihenfolge
soweit aufgefüllt bis er der gleichen länge des längeren vektors entspricht!
erst dann werden beide vektoren zusammen addiert/multipliziert wie bei der 
vektoradd/ vektormultiplik. ! 

bsp obda i):

x+y
# x= 2 3 und y = 1 4 5 6
# dh vektor x muss mit ihren eigenen elementen 2 und 3 aufgefüllt werden
# vektoraddition mit vektorrecycling nach folgenden schema
# ==> 2 3 2 3   (selbstauffüllung mit x = 2 3 damit länge 4 entsteht)
#     1 4 5 6 
# ==  3 7 7 9


bsp obda ii)

x*y
# x= 2 3 und y = 1 4 5 6
# dh vektor x muss mit ihren eigenen elementen 2 und 3 aufgefüllt werden
# vektormultiplik mit vektorrecycling nach folgenden schema
# ==> 2  3  2   3   (selbstauffüllung mit x = 2 3 damit länge 4 entsteht)
#     1  4  5   6 
# ==  2 12 10  18


#'
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
'#
regel: klammer setzung um rechen prioritäten zu setzen 


#klammer setzen um prioritäten also wie bei punktrechnung kommt vor
# strichrechnung! 
1) zudem gilt hier punkt vor strichrechnung stanni mäßig
2) potenzrechnung also hoch irgendwas kommt vor multiplikation


# i)  
4+2*3
#ausgabe: 10

# ii)  
4+(2*3)
#ausgabe: 10

# iii)  
(4+2)*3
#ausgabe: 18 


# iv)  
2^2*3
#ausgabe: 12 da 4 *3 gilt da potenz vor mal kommt

# v) 
(2^2)*3
#ausgabe: 2 hoch 2= 4 dann 4*3

# vi)  
2^(2*3)
#ausgabe: klammer wird zuerst ausgeführt daher 2 hoch 6


#'
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
'#
regel - standard befehle um datensatz zu lesen

datensatz heißt iris

bsp obda:

summary(iris) == zusammenfassung aller wichtiger daten bzgl des datensatzes
und jeweils der spalten






#'
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


#-----------------------------------------------------------------

#Aufgabe 2)

# a) vektor erstellung und zuweisung zu a2
a2<- c(2,-1,4)


# b) zuwesiung mit vektor
fibonacci<-c(1,1,2,3,5,8,13,21,34,55)

#c) schreibe kommentar mit #

# d) Addiere das 7. mit dem 8. Element der fibonacci Vektor
 fibonacci[7]+fibonacci[8]
 
#e) Benutze ähnliche Vorgehensweise, um  11. Fibonacci-Zahl zu bestimmen.
 fibonacci[9]+fibonacci[10]
 
#f) Fügen Sie die 11. Fibonacci-Zahl dem R-Vektor hinzu.
# fibonacci<-c(fibonacci,???)
#Sie müssen ??? durch den Befehl in Teil (e) ersetzen.
 
fibonacci<-c(fibonacci,fibonacci[9]+fibonacci[10]) 

# dh durch fibonacci[9]+fibonacci[10] nach dem Komma wird ein neuer wert
#hinzugefugt wird 


#g) Der Operator [ ] spielt verschiedene Rollen um eine 
#Teilmenge eines Vektors zu bestimmen.
#Z.B. Ein negative Zahl bedeutet alle Elemente ohne diesem.

fibonacci[-5]

# Die Ausgabe ist der fibonacci ohne das 5. Element.
# 1  1  2  3  8 13 21 34 55 89 89




#k) Benutzen Sie die Operator [ ] und :, um die folgende Elemente von 
#fibonacci zu bestimmen:
#(i) das dritte Element
#(ii) die ersten fünf Elemente
#(iii) das erste und das achte Element (in einem Befehl)
#(iv) und alle Elemente außer den vierten.

#i)
fibonacci [3]

#ii)
fibonacci [1:5]

#iii)

fibonacci [c(1,8)] 
#ausgabe vom ersten und achten wert des vektors c bzw, der fibo folge

#iv)
fibonacci [-4]

#--------------------------------------------------------------------

#aufgabe 3)


#3a) wurzel ziehen
sqrt(729)


#3b)

sqrt(3^2+4^2)


#3c)
#Man kann einen Vektor von geraden Zahlen zwischen 0 und 10 
#mit Hilfe der Funktion seq() erstellen:
seq(0,10,by=2)


#3d) exp(3) == e^3
exp(3)


#3e) bestimme ln 3 == log von 3 zur basis e

log (3, base=exp(1))

#3f) bestimme log von 3 also log 3 mit basis 10
log (3, base= 10)


#3h) und 3i) nachfragen


# 3j) summe von 1 bis 10 bestimmen
sum(1:10)


#3k) mittelwert ausgeben
mean(1:10)
sum(1:10)/10

#3 l) mittelwert der ersten 11 fibo zahlen

mean (fibonacci)
# ausgabe: 26.75

sum(fibonacci)/12
# ausgabe: 26.75 ==> durch 12 da wir leider 2 mal das 11. element hinzugefügt
# hatten


#--------------------------------------------------------------------
# aufgabe 4

#4a)
x <- c(2,3)
y <- c(1,4,5,6)

2*x
#ausgabe: 4 6

# man muss darauf achten dass : c == nutzung für vektornamen


#4b)
x+x

#ausgabe: 4 6
# dh jeder wert im vektor wird mit dem wert an der selben stelle addiert
# wie bei vektoradd.

#4c)
2+x
#ausgabe: 4 5

# zu jedem element im vektor c wird jeweils 2 dazuaddiert

#4d)

y^2
# ausgabe: 1 16 25 36
# dh jeder wert im vekotor wird hoch 2 genommen

# 4e) und 4f)
#Wenn die Anzahl der Elemente in zwei Vektoren ungleich sind, wird der 
#kürzere Vektor wiederholt,
#damit er die gleiche Länge als der längere Vektor ist. Dieses Verfahren 
#heißt Vektorrecycling. Stellen Sie sicher, dass Sie die folgende 
#Ergebnisse verstehen.


x+y
# x= 2 3 und y = 1 4 5 6
# addition mit vektor recycling
# ==> 2 3 2 3
#     1 4 5 6 
# ==  3 7 7 9

x*y
#ausgabe: 2 12 10 18
# selbes schema wie oben


#4g) klammer setzen um prioritäten also wie bei punktrechnung kommt vor
# strichrechnung! zudem gilt hier punkt vor strichrechnung stanni mäßig
 
# i)  
4+2*3
#ausgabe: 10

# ii)  
4+(2*3)
#ausgabe: 10

# iii)  
(4+2)*3
#ausgabe: 18 


# iv)  
2^2*3
#ausgabe: 12 da 4 *3 gilt da potenz vor mal kommt

# v) 
(2^2)*3
#ausgabe: 2 hoch 2= 4 dann 4*3

# vi)  
2^(2*3)
#ausgabe: klammer wird zuerst ausgeführt daher 2 hoch 6



#4h) bestimme ersten 5 quadratzahlen! man sieht klammersetzung ist hier
#wichtig!!:)

(2:5)^2 # ausgabe: 4  9 16 25

2:5^2 
#ausgabe:2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25

#==> dh die klammersetzung ist hinreichend!!

#--------------------------------------------------------------------

#aufgabe 5) datensatz einlesen und grundbefehle verstehen

#5a)
help("iris")
#informationen zu dem datensatz

#5b) 
#Erhalten Sie eine statistische Zusammenfassung jeder Variablen.
#(i) Wie viele Schwertlilien der Art Versicola sind im Datensatz?
#(ii) Was ist der Mittelwert der Blütenblattlänge?
 
summary(iris)

#i) versicolor: 50 , das steht unter spalte species
#ii) mean von petal.length ist 3.758



#5c) 
#Eine Variable in einem data.frame lässt sich durch die Syntax
#data.frame.name$variablen.name zugreifen.

mean(iris$Petal.Length)

#syntax: mean(<nameDatensatz>$<NameSpalte>)

#5d)
#Finden sie die Länge der längste Kelchblatt. (Tipp: max())

max(iris$Sepal.Width)

#syntax: max(<nameDatensatz>$<NameSpalte>)



#5e) Erzeugen Sie ein Histogramm von der Variable Sepal.Length
hist(iris$Petal.Length)

#syntax: hist(<nameDatensatz>$<NameSpalte>)

# ==> rechts unter bereich plots wird histogramm angezeigt

#5f) Erzeugen Sie ein sogenanntes Punktediagramm der Variable Sepal.
#Length mit Gruppierungsvariable Species.
#Klicken Sie auf Zoom im Grafikfenster. Was ist im Diagramm 
#dargestellt? Benutzen Sie das Diagramm um das längste 
#Kelchblatt der Art Setosa zu schätzen.

stripchart(Sepal.Length~Species,data=iris)

#syntax:stripchart(<nameSpalte> ~ <NameSpalte>, data=<NameDatensatz>)

#es wird die länge bzgl der arten jeweils mit einzelnen
# kästchen dargestellt. 
# die setosa hat circa die länge des kelchblattes 5.8



#5g) Der folgende Befehl, stellt die Variablen Blütenblattbreite 
# und Blütenblattlänge gemeinsam dar.
# Die Punktfarben entspricht die Blumenart.
# Diese Art Diagramms heißt Streudiagramm.

plot(iris$Petal.Length,iris$Petal.Width,col=iris$Species,pch=16)

#syntax:
# plot(<NameDatensatz$<NameSpalte>, <NameDatensatz$<NameSpalte>, 
# col = <NameDatensatz$<NameSpalteMitDarstellungDurchFarben>, pch=16)

# col == <wert> ==> der wert bestimmt obs punkte, dreiecke usw zur
# darstellung genutzt werden

#--------------------------------------------------------------------


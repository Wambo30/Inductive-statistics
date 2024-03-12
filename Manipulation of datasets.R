# blatt 2, Datensätze manipulieren 

#aufg1a): häufigkeiten in R

#eintragen Datensatz 1
Datensatz1<-rep(1:5,c(18,19,20,21,22))

#eintragen Datensatz 2
Datensatz2<-rep(1:5,c(20,18,22,19,21))

#eintragen Datensatz 3
Datensatz3<-rep(1:5,c(22,21,20,19,18))

#prüfung der daten
table(Datensatz1)
'#ausgabe:
Datensatz1
1  2  3  4  5 
18 19 20 21 22 
#'

table(Datensatz2)
'#ausgabe:
Datensatz2
 1  2  3  4  5 
20 18 22 19 21
#'

table(Datensatz3)
'# ausgabe:
Datensatz3
 1  2  3  4  5 
22 21 20 19 18 
#'
#--------------------------------------------------------------------
#aufgabe 1b):


rep(2,5)
'# ausgabe:
2 2 2 2 2

=> 5 mal die 2 ausgegeben also potenz 2^5 dh 5 ist exponent 
zur Basis 2
#'


rep(2:4,5)
'# ausgabe:
2 3 4 2 3 4 2 3 4 2 3 4 2 3 4

=> 5 mal wird die folge 2 3 4 ausgegeben also potenz (2,3,4)^5 dh
5 ist exponent und 2,3,4 ist basis


#'

rep(c(1,3),5)
'# ausgabe:
1 3 1 3 1 3 1 3 1 3

=> 5 mal wird der vektor c(1,3) ausgegeben also potenz (1,3)^5 dh
5 ist exponent zur basis (1,3)
#'


rep(c(1,3),c(2,4))
'# ausgabe:
1 1 3 3 3 3

=> 2 mal die 1 und 4 mal die 3 wird ausgegeben also potenz 1^2 und 
3^4 
#'

rep(2:4,1:3)
'# ausgabe:
2 3 3 4 4 4

=> 1 mal 2, dann 2 mal 3, dann 3 mal 4 ausgegeben also die potenzen
2^1 und 3^2 und 4^3 

#'

#--------------------------------------------------------------------

#aufg1c):
#Für kleine Datensätze kann man das ganze Objekt im Console zeigen.

table(Datensatz1)
'#ausgabe:
Datensatz1
1  2  3  4  5 
18 19 20 21 22 
#'

Datensatz1
'#ausgabe:
[1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
[35] 2 2 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4
[69] 4 4 4 4 4 4 4 4 4 4 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5

==> dh 18 mal die 1, dann 19 mal die 2, dann 20 mal die 3, dann
21 mal die 4, dann 22 mal die 5

#'

#1d)Um den Stichprobenumfang von Datensatz1 zu bestimmen

length(Datensatz1)
'# ausgabe : 100
stichprobenumfang == summe aller absoluten häufigkeiten der 
merkmale
dh n= 18+19+20+21+22 = stichprobenumfang

length(<Datensatzname>) == <WertStichprobenumfang>
#'


#1e) Summenhäufigkeiten bestimmen
table(Datensatz1)
'#ausgabe:
Datensatz1
1  2  3  4  5 
18 19 20 21 22 
#'


cumsum(table(Datensatz1))
'#ausgabe:
1   2   3   4   5 
18  37  57  78 100 

1.spalte bleibt
2.spalte: 18+19=37
3.spalte: 18+19+20= 57
4.spalte: 18+19+20+21= 78
5.spalte: 18+19+20+21+22=100

dh die absolute häufigkeit des vorherigen merkmals oder merkmale
wird auf die eigene absol. häufigkeit aufaddiert!

syntax: 
cumsum(table(<NameDatensatz))== <TabelleMerkmaleMitSummenHäufigk>

#'

# 1f)Ordnen Sie den Stichprobenumfang dem R-Objekten zu  und  
#erzeugen Sie die relativen Häufigkeiten:

# variante1 mit  n == Stichprobenumfang
n <- length(Datensatz1)
table(Datensatz1)/n

#variante 2:  einzeilige möglichkeit
prop.table(table(Datensatz1))

'# ausgabe variante1 = variante2:

Datensatz1
   1    2    3    4    5 
0.18 0.19 0.20 0.21 0.22 

=> relative Häufigkeit= (absoluteHäufigkVonMerkmal)\(n) 
n == Stichprobenumfang


syntax bestimme relative häufigkeit:
<NameVariableStichprobenumfang> <- length(<NameDatensatz1>)
table(<NameDatensatz1>)/ <NameVariableStichprobenumfang>

ODER
prop.table(table(<NameDatensatz1>))

#'


# 1g)  Wie  können  Sie  die  relativen Häufikeiten bestimmen?  
#(Tipp:  Stellen  Sie  Teile  (d)  und  (e) zusammen.)



#1h)  Erstellen Sie einen Säulendiagramm1des Datensatzes
barplot(table(Datensatz1))

'# ausgabe:
y-achse== absolute häufigkeiten bzgl den merkmalen
x-achse == merkmalsnamen also 1,2,3,4,5

#'

#--------------------------------------------------------------------

#aufgabe2) Daten zusammenfassen

'#regel: daten von csv datei bzw excel datei importieren

<VariableName> <- read_csv("<KompletterPfadVonOrdnerMitDatei>")
dann Strg+Enter

==> der befehl geht auch mit read_csv2 wobei Dateien gemeint sind
die im europäischen format gespeichert wurden
#'

weiss<-read.csv2("EStat/R-Studio/Einführ.Statistik_Downie_WS20-21/WeissDaten.csv")

# man sieht dann gesamte tabelle/datensatz mit merkmalen und 
#elementen


#aufg2a)Erstelle eine absolute Häufigkeitstabelle für Blutgruppe.
#Welche Rolle spielt das$Zeichen im Befehl? Ist Blutgruppe ein 
#nominal, ordinal, diskret oder stetig skaliertes Merkmal?

table(weiss$Blutgruppe)

'#ausgabe:
 0  A AB  B 
31 32  4  9

==> dh haben absolute häufigkeiten bestimmt wie oft A, B , 0 usw.
vorkommen! Das Merkmal Blutgruppe ist nominal, qualitativ, da es
keinen Wert darstellt und nur bezeichnung ist! Es hat auch keine
Rangfolge da eine Blutgruppe nicht besser ist als die andere


Regel- absolute Häufigkeit von einem Merkmal zu jeweils 
verschiedenen Elementen=Zeilen bestimmen

ID Geschlecht Größe ... Blutgruppe
1   männlich  1.67        A
2   weiblich  180         B
...

von spalte=merkmal blutgruppe wollen wir nun die absoluten 
häufigkeiten dazu wissen, wie oft sie in der ganzen tabelle
vorkommen

nutze syntax: table(<NameDatensatz>$<NameMerkmal>)

=> also gilt
table(weiss$Blutgruppe)

ausgabe:
 0  A AB  B 
31 32  4  9


#'


#aufg2b) Geben Sie den folgenden Befehl ein. Welche Art 
#Häufigkeiten wird hier ausgegeben? hier wird relative Häufigk
#bestimmt

# variante1:
prop.table(table(weiss$Blutgruppe))

#oder mit variante2 

n2<-length(weiss$Blutgruppe) # n2 stichprobenumfang bestimmt
table(weiss$Blutgruppe)/n2

'#ausgabe von Var1 und Var2:

         0          A         AB          B 
0.40789474 0.42105263 0.05263158 0.11842105 


==> haben die regel von relative häufigkeit oben benutzt
rel.Häufigkeit == absol. Häufigkeit von Merkmal / Stichprobenumfang
#'



round(prop.table(table(weiss$Blutgruppe)),3)
# damit werden bei relat. Häufigkeiten mit langen nachkommastellen
# auf 3 nachkommastellen aufgerundet

'#
regel- aufrunden wert auf 3 nachkommastellen

syntax: round(prop.table(table(weiss$Blutgruppe)),3)
==> bei ziffer=4 würde es auf 4 nachkommastellen aufgerundet werden
#'


#aufg 2c)Erstellen Sie ein Säulendiagramm von Blutgruppe 
# und von Rhesusfaktor

barplot(table(weiss$Blutgruppe))
barplot(table(weiss$Rhesusfaktor))



#2d)Die gemeinsame Häufigkeitder zwei Merkmale ist

table(weiss$Rhesusfaktor,weiss$Blutgruppe)

barplot(table(weiss$Rhesusfaktor,weiss$Blutgruppe))

'#ausgabe:
     0   A  AB  B
  -  5   5   0  2
  + 26  27   4  7


spaltenmerkmale von blutgruppe wobei die absoluten häufigkeiten
mit jenen von rhesusfaktor kombiniert werden

es müssen jene absolute häufigkeiten von der tabelle von der
blutgruppe am ende rauskommen WOBEI aber jede absolute häufigkeit
pro merkmal in rhesusfaktor + und - aufgeteilt ist

absolute häufigkeit von blutgruppe
= absol. häufigk. +(positiv) rhesusfak. +  absol. häufigk. - rhesusfak.

#'

#1e)Eine Häufigkeitstabelle von Größe

table(weiss$Groesse)

'# ausgabe:

155 156 159 160 162 163 164 165 166 167 168 169 170 171 172 173 174 175 
  1   1   1   1   2   4   1   6   2   2   6   2   7   2   2   3   2   2 
176 177 178 179 180 182 183 184 185 186 188 189 190 195 197 
  3   3   2   2   4   2   1   1   2   4   1   1   1   1   1 

==> oben steht merkmal =größe und darunter die absol. Häufigkeit
bzgl jeder größe

#'


#1f) Benutze die R-Funktion cut()um Groesse in Gruppen zu 
#"schneiden" d.h. zu verteilen.

table(cut(weiss$Groesse,c(150,160,170,180,190,200)))
'#ausgabe:
(150,160] (160,170] (170,180] (180,190] (190,200] 
        4        32        25        13         2 

==> halboffenes intervall was links offen bzgl jedes intervalls
jeweils ist. Die zahlen im vektor c bestimmen die Intervallgrenzen

syntax - links offenes intervall:
table(cut(<TabellenName>$<NameMerkmal>,c(<IntervallGrenze1>,<IntervallGrenze2>,...,)))

#'


table(cut(weiss$Groesse,c(150,160,170,180,190,200),right=F))
'#ausgabe:
[150,160) [160,170) [170,180) [180,190) [190,200) 
        3        26        28        16         3 
        
==> halboffenes intervall was rechts offen bzgl jedes intervalls
jeweils ist. Die zahlen im vektor c bestimmen die Intervallgrenzen        

syntax- rechts offenes intervall:
table(cut(<TabellenName>$<NameMerkmal>,c(<IntervallGrenze1>,<IntervallGrenze2>,...,), right=F))
#'


#1g) Was ist der Anteil der Studenten, die Raucher sind?
# dh man bestimmt die relative häufigkeit

#relative häufigkeit = absoluteHäufigkeitDesMerkmals / Stichprobenumfang

barplot(table(weiss$Raucher))

#variante 1:
prop.table(table(weiss$Raucher))

#variante 2:
n3<-length(weiss$Raucher) 
table(weiss$Raucher)/n3

#length == bestimmt stichprobenumfang des merkmals raucher
# also die summe bzw anzahl aller absoluten häufigkeiten
# bzgl dieses merkmals

'#ausgabe bei beiden Varianten:

       ja      nein 
0.2631579 0.7368421 

#'

#auf 3 nachkommastellen aufrunden
#für variante 1:
round(prop.table(table(weiss$Raucher)),3)

#für variante 2:
round(table(weiss$Raucher)/(n3),3)

'#ausgabe bei beiden varianten:

   ja  nein 
0.263 0.737


#'


#1h)Wie viele Studenten haben einen Gewicht von 80Kg bis unter 90Kg?
'#
wir nutzen das rechts offene intervall also:

syntax- rechts offenes intervall:
table(cut(<TabellenName>$<NameMerkmal>,c(<IntervallGrenze1>,<IntervallGrenze2>,...,), right=F))

#'

table(cut(weiss$Gewicht, c(80,90),right=F ))

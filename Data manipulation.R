# blatt 2 

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



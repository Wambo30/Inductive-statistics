#übung 6, statistische Werte aus datensatz

#aufg 1a) Lade nochmal den Weiß Datensatz wie in Übungsblatt 2.(a)  
#Benutzen  Sie  die  folgenden R Befehle  um  die  gegebenen Kenngrößen  
#für  Menschengröße  zubestimmen. 
#Tipp: Sie müssen die Datensatz-"Dollar"-Variablennamen Schreibweise 
#verwenden.mean(),median(),var(),sd(),IQR(),range(),diff()

weiss2<-read.csv2("EStat/R-Studio/Einführ.Statistik_Downie_WS20-21/WeissDaten.csv")

table(weiss2)

#i) mean() also mean(weiss) == ausgabe: KEINE weil das nicht klappt!
#brauchen numerische werte
mean(weiss2$Groesse) # ausgabe: 66.09211
median(weiss2$Groesse) # ausgabe: 171.5
var(weiss2$Groesse)# ausgabe: 81.16561
sd(weiss2$Groesse) # ausgabe: 9.009196
IQR(weiss2$Groesse) # ausgabe: 12.5
range(weiss2$Groesse) # ausgabe: 155 197
diff(weiss2$Groesse) 
# ausgabe: 66.09211


'# regel- standardbefehle für datensatz

<befehl>(<nameDatensatzNurMitNumWerten>) 
ODER
<befehl>(<nameDatensatz>$<NameSpalteMitNumWerten)

bsp obda:

Mittelwert
mean(weiss2$Groesse) => ausgabe: 66.09211

Median
median(weiss2$Groesse) # ausgabe: 171.5

Varianz
var(weiss2$Groesse)# ausgabe: 81.16561

Standardabweichung
sd(weiss2$Groesse) # ausgabe: 9.009196


Quartilsabstand
IQR(weiss2$Groesse) # ausgabe: 12.5

Max und Min bestimmen(zuerst max dann min wert)
range(weiss2$Groesse) # ausgabe: 155 197

Differenz von zwei werten, wird bei spannweite benutzt
diff(range(weiss2$Groesse)) 


variantionskoeffizient Vk= Stdabweichung/ mittelwert
stdabweichung<-sd(weiss2$Groesse)
stdabweichung/ mean(weiss2$Groesse)
===> ausgabe: 0.05202089

#'

#aufg1b)Finden Sie die Endwerte des Intervalls [x???2s;x+ 2s]
# x == mittelwert

linkeSeite<- mean(weiss2$Groesse)-(2*sd(weiss2$Groesse))
#==> ausgabe: 155.1658
# WICHTIG! die doppelte klammer beim zweiten term ist HINREICHEND
# sonst kommt falsches ergebnis raus!!


rechteSeite<- mean(weiss2$Groesse)+2*sd(weiss2$Groesse)
# ==> ausgabe: 191.2026

#-------------------------------------------------------------------

#aufg 1c) Benutzen Sie denRBefehlsort(), um die Werte zu ordnen und 
# zählen Sie wie viele Werteaußerhalb des Intervalls liegen

sort(weiss2$Groesse)
'# ausgabe: [1] 155 156 159 160 162 162 163 163 163 163 164 165 165 165 165 165 165
[18] 166 166 167 167 168 168 168 168 168 168 169 169 170 170 170 170 170
[35] 170 170 171 171 172 172 173 173 173 174 174 175 175 176 176 176 177
[52] 177 177 178 178 179 179 180 180 180 180 182 182 183 184 185 185 186
[69] 186 186 186 188 189 190 195 197

==> dh 2 werte liegen außerhalb vom intervall da 195 und 197 größer
als die rechte grenze 191.2026 sind UND 155 ist auch außerhalb da die
linke grenze == 155.1658 ist!

#'

#-------------------------------------------------------------------

#d) Bestimmen  Sie  die  Anzahl  der  Werte  im  Intervall,  
#und  vergleichen  Sie  diese  mit  der  95%-Faustregel im Teil 6.1

length(weiss2$Groesse)

'# wir sehen das NUR drei werte außerhalb des intervalls liegen
also demnach die restlichen 73 werte (da stichprobenumfang=76)
im intervall liegen ==> dh mindestens 95% der werte liegen im
intervall


#'

#-------------------------------------------------------------------
#-------------------------------------------------------------------


#aufg2) Erzeugen Sie 4 Zufallsstichproben aus der 
#Normalverteilung N(0,??2)vom Umfang 200.Die 4 entsprechenden 
#Grundgesamtheiten haben Varianz ??2= 0.5^2,1^2,1.5^2 bzw.2^2. 
#bsp StichA <-rnorm(200,0,0.5)

'# regel- bestimmung zufallsstichproben aus normalverteilung

mit rnorm werden zufällige standardnormalverteilte zufallszahlen
erzeugt also rnorm(100) == 100 std. normalverteilte zufallszahlen

syntax:
rnorm (<StichprobenUmfang>, <Mittelwert>, <VarianzS^2>)

#'


StichB<- rnorm(200,0,0.5)
StichC<- rnorm (200,0, 1)
StichD<- rnorm (200, 0 , 5)
StichE<- rnorm (200, 0 , 2)  

sd(StichB)

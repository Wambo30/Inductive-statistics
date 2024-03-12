#übung 7 - korrelation, kovarianz

'#Aufg1)Automobilclub Aufgabe mit R. Diese Aufgabe bezieht sich auf 
die Automobilclub Daten in Aufgabe 2 Aufgabenblatt 7, die Sie schon
gelöst haben.

1a)  Benutzen  Sie  die  Funktion matrix() um  die Häufigskeitstabbelle
einem  Objekt AutoClub zuzuweisen
#'

#eingabe daten spaltenweise --> nrow=3,ncol=3 sind hinreichend
#damit tabelle mit 3 zeilen und 3 spalten in der spaltenweisen
#reihenfolge gebildet wird==> sonst haben wir nur eine spalte als 
#ausgabe
AutoClub<- matrix(c(58,28,30,12,25,9,26,10,2),nrow=3,ncol=3)
AutoClub

#eingabe daten zeilenweise -->byrow=TRUE hinreichend damit daten als
#zeilen erkannt werden
AutoClub2<- matrix(c(58,12,26,28,25,10,30,9,2),nrow=3,ncol=3,byrow=TRUE)
AutoClub2


'# regel- darstellung daten in tabelle mit matrix befehl

es gibt 2 arten die daten in die tabelle einzugeben damit sie auch
an der richtigen stelle stehen: 
i) spaltenweise dh ab zeile 1 werden die daten von gesamter spalte 1
bis zur letzten zeile in matrix befehl eingetragen
--> dann ab zeile 1 von spalte 2 dasselbe usw

ii) zeilenweise, ab spalte 1 werden daten von gesamter zeile 1 bis
zur letzten spalte in matrix befehl eingetragen
-->dann ab zeile 1 von spalte 1 dasselbe usw

syntax- eintragen daten spaltenweise:
<NameDatensatz><- matrix(c(<WertSpalte1Zeile1>,<WertSpalte1Zeile2>,...,<WertSpalte2Zeile1>,<WertSpalte2Zeile2>,...)
                         ,nrow=<WertZeilenZahl>,ncol=<WertSpaltenZahl>)

==> nrow, ncol befehl sind hinreichend damit eine passende tabelle
mit der richtigen dimension gebildet wird


syntax- eintragen daten zeilennweise:
<NameDatensatz><- matrix(c(<WertSpalte1Zeile1>,<WertSpalte1Zeile2>,...,<WertSpalte2Zeile1>,<WertSpalte2Zeile2>,...)
                         ,byrow=TRUE,nrow=<WertZeilenZahl>,ncol=<WertSpaltenZahl>)

==> byrow=TRUE ist zusätzlich noch hinreichend, damit die daten als
zeilendaten erkannt werden.

bsp obda: datensatz vom blatt wollen wir in R übertragen

                    Automarke
                    A   B   C 
Benzinmangel        58  12  26
Kolbenfresser       28  25  10
Kabelbrand          30   9   2


eingabe daten spaltenweise --> nrow=3,ncol=3 sind hinreichend
damit tabelle mit 3 zeilen und 3 spalten in der spaltenweisen
reihenfolge gebildet wird==> sonst haben wir nur eine spalte als 
ausgabe

AutoClub<- matrix(c(58,28,30,12,25,9,26,10,2),nrow=3,ncol=3)
AutoClub

eingabe daten zeilenweise -->byrow=TRUE hinreichend damit daten als
zeilen erkannt werden

AutoClub2<- matrix(c(58,12,26,28,25,10,30,9,2),nrow=3,ncol=3,byrow=TRUE)
AutoClub2

#'

#-------------------------------------------------------------------

#b) Fügen Sie der Matrix Zeilen- und Spaltennamen. Bemerken Sie, 
# dass diese sind nur Namen und nicht zu der Matrix gehören.

rownames(AutoClub)<- c("Benzinmangel","Kolbenfresser","Kabelbrand")
colnames(AutoClub)<-LETTERS[1:3]
AutoClub


'# regel- datentabelle zeilen und spalten benennen

-haben datentabelle mit matrix befehl bereits erstellt wo es zeilen
und spalten gibt

syntax - zeilen benennen
rownames(<NameDatensatz>)<- c("<NameZeile1>","<NameZeile2>",...)

syntax- spalten benennen
colnames(<NameDatensatz>)<- c("<NameSpalte1>","<NameSpalte2>",...)

bsp obda:

rownames(AutoClub)<- c("Benzinmangel","Kolbenfresser","Kabelbrand")
colnames(AutoClub)<-LETTERS[1:3]
AutoClub

==> Ausgabe:

                    Automarke
                    A   B   C 
Benzinmangel        58  12  26
Kolbenfresser       28  25  10
Kabelbrand          30   9   2

#'

#-------------------------------------------------------------------

#1c)Benutze apply um die Randhäufigkeiten von AutoClub zu berechnen.

UrsacheRandHaeufigkeit<- apply(AutoClub,1,sum)
MarkeRandHaeufigkeit<- apply(AutoClub,2,sum)
AutoClub

'#regel- randhäufigkeiten in tabelle bestimmen

<NameRandHäufigkeitZeilen> <- apply(<NameDatensatz>,1,sum)
==> in einem vektor werden die randhäufigkeiten der zeilen im
environment fenster ausgegebn

<NameRandHäufigkeitSpalten> <- apply(<NameDatensatz>,2,sum)
==> in einem vektor werden die randhäufigkeiten der spalten im
environment fenster ausgegebn

#'
#-------------------------------------------------------------------

#1d)  Der folgende Befehl berechnet die erwartete Häufigkeiten

E<-outer(UrsacheRandHaeufigkeit,MarkeRandHaeufigkeit)/sum(AutoClub)

'# regel- erwartete häufigkeiten bestimmen

syntax und ablauf:

1)Zeilenrandhäufigkeit bestimmen
<NameRandHäufigkeitZeilen> <- apply(<NameDatensatz>,1,sum)

2)Spaltenrandhäufigkeit bestimmen
<NameRandHäufigkeitSpalten> <- apply(<NameDatensatz>,2,sum)

3)erwartete häufigkeit bestimmen
<NameErwarteHäufigkeiten><-outer(<NameRandHäufigkeitZeilen>,<NameRandHäufigkeitSpalten>)/sum(<NameDatensatz>)


bsp obda:
1)zeilenrandhäufikeit
UrsacheRandHaeufigkeit<- apply(AutoClub,1,sum) 

2)spaltenrandhäufigkeit
MarkeRandHaeufigkeit<- apply(AutoClub,2,sum)

3)erwartete häufigkeit
E<-outer(UrsacheRandHaeufigkeit,MarkeRandHaeufigkeit)/sum(AutoClub)


#'
#-------------------------------------------------------------------

#1e)Berechne die  quadratische  Kontingenz U.Erhalten  Sie  das  
#gleiche  Ergebnis  wie  bei berechnung per hand?

U<-sum((AutoClub-E)^2/E)
#ausgabe: 23.8932

'# regel- bestimmen von quadratischer kontingenz 
quadr. kontigenz ==> bestimmung U prüfgröße

E == Name wo erwartete Häufigkeit gespeichert ist

syntax:
U<- sum((<NameDatensatz>- E)^2/E)

bsp obda:

E<-outer(UrsacheRandHaeufigkeit,MarkeRandHaeufigkeit)/sum(AutoClub)

U<-sum((AutoClub-E)^2/E)
==> ausgabe: 23.8932 =U , das steht im environment fenster


#'

#-------------------------------------------------------------------


#1f)Freiheitsgrad m und Kritischen Wert für U bestimmen um damit 
#zu vergleichen

'# regel- bestimmung freiheitsgrad m und kritischer wert für u

ablauf
1) bestimme zuerst freiheitsgrad m mit 
formel freiheitsgrad m : m= (J-1)*(K-1) mit J=Anzahl Zeilen,
K=Anzahl Spalten
==> man zählt einfach die Zeilen und Spaltenanzahl in der tabelle
ab und hat m

2) bestimme kritischen wert
qchisq(0.95, m) ==> ausgabe kritischer wert
==> 0.95 ist immer fest hier!


bsp obda:

1)
m= (J-1)*(K-1) = (3-1)*(3-1) = 4 da wir 3 Zeilen und 3 Spalten in
Datensatz/Tabelle AutoClub haben

2)qchisq(0.95, 4) == 9.487729 == kritischer wert

#'

qchisq(0.95, 4)
#ausgabe: 9.487729 dh wir vergleichen nun U mit kritischenWert 9.8773
# also wenn folgendes gilt:
# i) U > kritischerWert ==> Abhängigkeit der Merkmale ex.
# ii) U < kritischerWert ==> Unabhängigk. der Merkmale ex.

#==> U>kritischerWert <=> 23.8932 > 9.487729 ==> somit sind die
# schadensursachen von der Automarke und andersherum abhängig!

#-------------------------------------------------------------------
#-------------------------------------------------------------------

'#
Die folgende Tabelle enthält Körpergrößen von 5 Kindern in 
Zentimetern und Zoll an (der Umrechnungsfaktor ist 1 Zoll = 2.54 cm).

cm   121.92   132.08  127.00   132.08  139.70
Zoll 48.00    52.00   50.00    52.00   55.00

aufg1a)  Berechnen Sie für beide Messreihen die folgenden 
Kennzahlen: Mittelwert, Stichproben-Varianz,Standardabweichung, 
Variationskoeffizient. (Sie dürfen R Studio benutzen)

#'

# 1) vektor bilden wo alle daten enthalten sind

# wir müssen nicht extra eine tabelle bilden mit matrix() befehl
# da wir nur einfache kennzahlen bestimmen
KörpergrößeCM<- c(121.92, 132.08, 127.00, 132.08, 139.70)
KörpergrößeZoll<-c(48.00, 52.00, 50.00, 52.00, 55.00)

#2) Mittelwert bilden

meanCM<-mean(KörpergrößeCM)
#ausgabe: 130.556

meanZoll<-mean(KörpergrößeZoll)
#ausgabe: 51.4


#3)varianz bilden

varCM<-var(KörpergrößeCM)
#ausgabe: 43.87088

varZoll<-var(KörpergrößeZoll)
#ausgabe: 6.8


#4)standardabweichung bilden

sdCM<-sd(KörpergrößeCM)
#ausgabe:6.62351

sdZoll <- sd(KörpergrößeZoll)
#ausgabe:2.607681

#5) variantionskoeffizient Vk= Stdabweichung/ mittelwert bilden

vkCM<-sdCM/meanCM
vkCM
#ausgabe: 0.05073309

vkZoll<- sdZoll/meanZoll
vkZoll
#ausgabe: 0.05073309
# ==> haben beide den gleichen vk! warum?


#-------------------------------------------------------------------

#2b)Erläutern Sie an Ihren Ergebnissen die Verhältnisse 
#der Kennzahlen für die beiden Messreihen

verhältnisMean<- meanCM/meanZoll
#ausgabe: 2.54

verhältnisVar<- varCM/varZoll
#ausgabe: 6.54 = (2.54)^2

verhältnisSd<- sdCM/sdZoll
#ausgabe: 2.54

verhaltnisVk<- vkCM/vkZoll
#ausgabe: 1

'# regel- verhältnis bilden von werten der zeilen(beobachtungen)

verhältnisZahl == größereZahl/kleinereZahl 
==> aber das muss nicht immer sein! es muss aber sinnvoll sein.Da
in dem bsp hier 1 zoll= 2.54cm sind ist es SINNVOLL das die werte
von zoll den nenner im quotienten immer darstellen!


meanCM/meanZoll<=>130.556 / 51.4 = 2.54
==> dh das verhältnis zwischen beiden liegt bei 2.54

#'

#-------------------------------------------------------------------

#2c)Ohne Rechnung, was ist der Korrelationskoeffizient für diese 
#zwei Messreihen?
#==> =1, da alle Punkte auf einer Gerade liegen

#-------------------------------------------------------------------

#2d)Mit Hilfe von (c) Berechnen Sie der Kovarianz zwischen diese 
#zwei Merkmale?

'# nutzen formel für korellatinskoeffizient :
<WertKovarianzZwischenZweiMerkmalen> / <StdAbweichungMerkmal1>*<StdAbweichungMerkmal2>

=> wir müssen nur die gleichung umstellen und mit dem nenner vom
korrelationskoeffizienten multiplizieren

#'

wert <-sdCM * sdZoll
# wert== 6.62351 * 2.607681
#ausgabe: wert== 17.272 dh das wird divisor von 1 da korrelations
#koeffizient 1 ist

kovarianzWert<-1 * wert
#ausgabe: wert== 17.272 da wir die gleichung oben also die formel
#umgestellt haben


#-------------------------------------------------------------------
#-------------------------------------------------------------------

'# Aufgabe 3 Kovarianz und Korrelation in R Im  Folgenden  sind  
die  monatlichen  Haushaltseinkommen  und  Konsumausgaben  von  
14  
Haushaltenangegeben:
Einkommen:  
1000 ,  2500 ,  2000 ,  2500 ,  1500 ,  1000 ,  2000 ,1500,  1200 ,
1800 ,  1700 ,  1300 ,  2300 ,  2200

Ausgaben:  
1000 ,  2000 ,  1800 ,  2200 ,  1200 ,  800 ,  1600 ,1400,1060 ,
1540 ,  1460 ,  1140 ,  1940 ,  1860

3a)  Erzeugen Sie zwei R-Vektoren für Einkommen und Ausgaben.
#'


Einkommen<-c(1000, 2500,  2000, 2500, 1500, 1000, 2000, 1500, 1200,  1800,  1700,  1300,  2300,  2200)
Ausgaben<-c(1000,  2000,  1800,  2200,  1200,  800,+ 1600,  1400,  1060,  1540,  1460, 1140,  1940,  1860)

#-------------------------------------------------------------------

#aufg 3b)Erstellen Sie ein Streudiagrammplot() der Daten und überlegen 
#Sie damit, welchen Zusam-menhang die beiden Merkmale haben sollten
   
plot(Einkommen, Ausgaben)
# ausgabe: streudiagramm wo die paarwerte fast parallel an einer 
#gerade entlang verlaufen


'# regel- zusammenhang zwischen merkmalen am streudiagramm aufzeigen

wenn man zwei datenvektoren hat, dann einfach im streudiagramm
vergleichen

syntax: plot(<DatenVektor1>,<DatenVektor2>)

bsp obda:

Einkommen<-c(1000, 2500,  2000, 2500, 1500, 1000, 2000, 1500, 1200,  1800,  1700,  1300,  2300,  2200)
Ausgaben<-c(1000,  2000,  1800,  2200,  1200,  800,+ 1600,  1400,  1060,  1540,  1460, 1140,  1940,  1860)

plot(Einkommen, Ausgaben)
==> ausgabe: streudiagramm wo die paarwerte fast parallel an einer 
gerade entlang verlaufen. dh es warscheinlich ein direkter zusammen-
hang zwischen den Merkmalen also sie korrelieren!

#'
#-------------------------------------------------------------------

#3c)Überprüfe Vermutung  durch  Berechnung  von  Kovarianz  und  
#Korrelation. Welches Vorzeichen haben die beiden Kennzahlen? 
#[R Befehle:cov() und cor()]

cor(Einkommen,Ausgaben,use="everything", method=c("pearson"))
# ausgabe: 0.9826797

cov(Einkommen,Ausgaben,use="everything", method=c("pearson"))
#ausgabe: 216307.7

cor(Einkommen,Ausgaben)
# ausgabe: 0.9826797

cov(Einkommen,Ausgaben)
#ausgabe: 216307.7

#==> dh da der korrelationskoeffizient bei 0.98 liegt exisitert
#ein starker zusammenhang zwischen einkommen und ausgaben

#-------------------------------------------------------------------

#3d)Bestimme den Rangkorrelationskoeffizienten nach Spearman für 
#Einkommen und Ausgaben.Bekommen Sie ein ähnliches Ergebnis? 
#Hinweis:help(cor)


cor(Einkommen,Ausgaben,use="everything", method=c("spearman"))
#ausgabe: 0.9955947 dh das ergebnis ist fast gleich da nach pearson
#beim korrelationskoeffizienten 0.9826797 herauskam!


'# regel- kovarianz, korrelationskoeffizient,
rangkorrelationskoeffizient bestimmen


syntax korrelationskoeffizient nach pearson:

cor(<NameDatenVektor1>,<NameDatenVektor2>,use="everything", method=c("pearson"))

ODER
cor(<NameDatenVektor1>,<NameDatenVektor2>)

==>ausgabe wert


syntax korrelationskoeffizient nach spearman
(rangkorrelationskoeffizient):

cor(<NameDatenVektor1>,<NameDatenVektor2>,use="everything", method=c("spearman"))

==>ausgabe wert


syntax kovarianz:

cov(<NameDatenVektor1>,<NameDatenVektor2>,use="everything", method=c("pearson"))

ODER
cov(<NameDatenVektor1>,<NameDatenVektor2>)

==>ausgabe wert

bsp obda:


Einkommen<-c(1000, 2500,  2000, 2500, 1500, 1000, 2000, 1500, 1200,  1800,  1700,  1300,  2300,  2200)
Ausgaben<-c(1000,  2000,  1800,  2200,  1200,  800,+ 1600,  1400,  1060,  1540,  1460, 1140,  1940,  1860)

durch plot(Einkommen, Ausgaben) also durch streudiagram habe wir
gesehen das die paarwerte paralell an einer geraden verlaufen dh
es exisitert warscheinliche eine starke abhängigkeit

==> schauen nun ob der korrelationskoeffizient das bestätigt

cor(Einkommen,Ausgaben,use="everything", method=c("pearson"))
==> ausgabe: 0.9826797

mit rangkorrelationskoeffizient also nach spearman
cor(Einkommen,Ausgaben,use="everything", method=c("spearman"))

==>ausgabe: 0.9955947 dh das ergebnis ist fast gleich da nach pearson
beim korrelationskoeffizienten 0.9826797 herauskam!


cov(Einkommen,Ausgaben,use="everything", method=c("pearson"))
==>ausgabe: 216307.7 (brauchen wir nicht )

ODER einfacher geschrieben

cor(Einkommen,Ausgaben)
==> ausgabe: 0.9826797

cov(Einkommen,Ausgaben)
==>ausgabe: 216307.7 (brauchen wir nicht)

==> dh 
korrelationskoeffizient (nach pearson) == 0.98 
rangkorrelationskoeffizient (nach spearman ) == 0.9955947

--> dh beide liegen sehr nah an der 1 und sagen somit aus das die
merkmale abhängig voneinander sind!

Merke:
rangkorrelation ist robuster gegen ausreißern ist vlcht eher zu
empfehlen als der korrelationskoeffizient von pearson.
es hängt aber auch von den werten ab!

#'

#-------------------------------------------------------------------

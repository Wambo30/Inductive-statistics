#übung 8 : regression


#aufg1)Regressionsrechnung in R
#(a)Erzeuge zwei R-Objekte Uebernacht und Verbrauch mit den obigen Daten
# x == uebrnacht , y == verbrauch

'# REGEL  == Aufgabe 1- bestimmung Regressionssteigung b0,
Regressionsabschnitt b1, Kovarianz, Summenzeichen, Varianz

#'

Uebernacht<-c(20,50,70,100,100) 
Verbrauch<-c(25,35,20,30,45)


#1b)Stellen Sie die Daten in einem Streudiagramm dar.

plot(Uebernacht, Verbrauch)
'# ausgabe: streudiagramm wo auf x achse übernacht werte und auf 
y achse verbrauch werte stehen. jeder punkt stellt eine werte paar dar.
man sieht je länger man da übernachtet desto größer ist der verbrauch
an wasser

#'

#1c)Berechne die folgenden Kenngrößen 
#i) mittelwert von x also uebernacht: 
mu<-mean(Uebernacht)
#ausgabe: 68

#ii)mittelwert von y also verbrauch;
mv<-mean(Verbrauch)
#ausgabe: 31

#iii) gibts hierfür überhaupt ein r befehl???
sum((Uebernacht-mu)^2)
#ausgabe: 4680
#====>summenzeichen = sum

#iv)ähnlich wie kovarianz aber mal 1(n-1) da das fehlt
#dh wir nutzen wert von kovarianz und multiplizieren das mit 1/4

sum((Uebernacht-mu)*(Verbrauch-mv))
#ausgabe: 610
#===>dh benutzen hier ganz einfach den sum befehl wie davor!



#v)s^2 von x also varianz von x:
var(Uebernacht)
#ausgabe: 1170

#vi)kovarianz bilden von x und y
cov(Uebernacht, Verbrauch)
# ausgabe:152.5


# vii)  Regressionssteigung b^1

b1<-cov(Uebernacht,Verbrauch)/var(Uebernacht)
#ausgabe: 0.130
#===> orientierung an der formel

# viii)regressionsabschnitt b^0

b0<-mean(Verbrauch)-b1*mean(Uebernacht)
#ausgabe: 22.137
# ===> somit lautet die regressionsfkt: 
# f(x) = 22.137+0.130*Uebernacht


#e) Ziehe die Regressionsgerade in das Diagramm  ein.[Der  
#Befehl abline(c(b0,b1)) zeichnet eine Gerade mit Abschnitt b0 
#und Steigung b1]



points(20,b0+b1*20,col=2)
points(100,b0+b1*100,col=2)
abline(c(b0,b1),col=2)
points(mu,mv,col="blue") # überschneidung der mittelwerte?

'#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  

regel- points(), abline()

syntax abline() zur Bestimmung der Regressionsgeraden:

abline(<NameLinearesModell>, col="<NameFarbeOderZahlFarbe>")
ODER
abline(c(<NameRegressionsYabschnitt>,<NameRegressionsSteigung>))


syntax points() zu bestimmung/einzeichnen von punkten im diagramm:

points(<Xwert>, <YwertOderTerm>, col="<NameFarbeOderZahlFarbe>")


bsp obda:

model<-lm(Verbrauch~Uebernacht)
plot(Uebernacht,Verbrauch)
abline(model,col="blue")

==>ausgabe: streudiagramm mit regressionsfkt in blau. Mit linearen
model lm(y~x) ist es ein tick einfacher umzusetzen!

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #'


#===> man kann hier die regressionsgerade NUR sehen wenn man zuvor
# einen plot von verbrauch und uebernacht erstellt hat


#f) Wie groß ist der Wasserverbrauch, laut des Regressionsmodells, 
#wenn das Hotel 70 Übernachtun-gen in der Woche hat?= 31.268

b0+b1*70 
# wegen f(x) = 22.137+0.130*Uebernacht dh man setzt einfach 
# Uebernacht == 70 ein und ausgabe : 31.268
points(70,b0+b1*70, col=4)


#g)  Berechnen Sie die fünf Residuen.0.2564, 6.346, -11.26, -5.171, 
#und 9.829

angepasst<-b0+b1*Uebernacht
#ausgabe: 24.74359  28.65385  31.26068  35.17094  35.17094

residuen<-Verbrauch-angepasst
#0.2564103   6.3461538   -11.2606838   -5.1709402   9.8290598


'# ====> GESAMTE aufgabe1 ist eine REGEL!!!! #'




#-------------------------------------------------------------------
#-------------------------------------------------------------------


'#Aufgabe2) Regression in R mit lm 
Sie wiederholen nun Aufgabe 1 mit den Standard-R-Befehlen. Um ein 
einfaches lineares Modell der Form y=b0+b1x in R zu erstellen, 
benutzt man die Funktion lm(y~x) oder lm(y~x,dataframe).Die zweite 
Variante ist für x und y Variablen aus der Datenmatrix dataframe 
geeignet. Für diese Aufgabe benutzen Sie die 1. Variante. Prüfen Sie 
an jedem Schritt, dass Ihre Ergebnisse in Aufgaben 1 und 2 
übereinstimmen


REGEL == Aufgabe2- bestimmen Regressionsabschnitt b0,
regressionssteigung b1 über tabellenbefehl summary und lineares modell
um somit andere daten abzulesen

#'

#2a)Erstelle das lineares Modell der Hoteldaten, und ordnen Sie 
#die Ergebnisse zu dem Objekt lm.obj1 zu

lm.obj1<-lm(Verbrauch~Uebernacht)
# nach regel lm(y~x)


'#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  

regel- bestimmen von linearen modell

syntax: 1) lm(y~x) oder 2)lm(y~x,dataframe)

zu 2): wird benutzt wenn man vorher eine datenmatrix dataframe 
erzeugt hatte

==> allgemein gilt: y == werte die abhängig von x sind
x == unabhängige werte dh x hat einfluss auf y. es ist gerichtet also
x -> y wie bei funktion

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #'


#-------------------------------------------------------------------


#2b)  Schauen Sie an den Ergebnissen:  
summary(lm.obj1)
# ausgabe: tabelle mit residuen, p-wert, geschätzten wert usw

'# ausgabe ==>

Call:
lm(formula = Verbrauch ~ Uebernacht)

Residuals:
       1        2        3        4        5 
  0.2564   6.3462 -11.2607  -5.1709   9.8291 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)
(Intercept)  22.1368    10.7256   2.064    0.131
Uebernacht    0.1303     0.1438   0.906    0.432

Residual standard error: 9.84 on 3 degrees of freedom
Multiple R-squared:  0.2149,	Adjusted R-squared:  -0.04682 
F-statistic: 0.8211 on 1 and 3 DF,  p-value: 0.4317
#'

#-------------------------------------------------------------------

#2c)Aus diesen Ergebnissen finden Sie die folgenden Werte


#i)b^0 == y abschnitt = 22.137
#warum?das steht in der zeile (intercept) in spalte estimate


#ii)b^1 == steigung = 0.1303
#warum?steht in zeile uebernacht in spalte estimate 

'# man kann auch mit folgenden befehl b0 und b1 ausgeben:
lm.obj1$coefficients

==> ausgabe: 
(Intercept)  Uebernacht 
 22.1367521   0.1303419 

dh kommt aufsselbe hinaus.man muss es dann nur noch richtig ablesen

#'


#iii) Der p-Wert der Variable Uebernacht
# ==> 0.432 der in spalte Pr(>|t|) steht in zeile uebernacht.
# das steht immer NIE in zeile (intercept)! 


#iv)bestimmheit des modells

'# Die bestimmtheit wird durch ungleichung mit0.05 geprüft bzw. 
liegt bei 0.05.
Da 0.432>0.05 gilt, ist es statistisch nicht signifikant! 
dh der verbrauch ist NICHT von den übernachtungen abhängig! das hat 
warscheinlich mit dem datenmangel zu tun, da es sonst eine sichere 
abhängigkeit geben müsste bzw. auch objektiv gesehen die stichprobe
zu klein ist um eine solche abhängigkeit zu bestätigen!

==> dh man sagt n==Stichprobenumfang = 30 damit man relativ 
robuste aussage treffen kann!

'#
#-------------------------------------------------------------------

#2d)bestimme angepasste werte

fitted(lm.obj1)
lm.obj1$fitted.values

#-------------------------------------------------------------------

#2e)Bestimme die Residuen

resid(lm.obj1)
lm.obj1$residuals

#-------------------------------------------------------------------
#Stelle residuen gegen die angepassten werte in einem Diagramm dar

plot(fitted(lm.obj1),resid(lm.obj1))
#ausgabe: plot mit 5 punkten die relativ weit auseinander liegen


#-------------------------------------------------------------------
#-------------------------------------------------------------------

'#
Aufgabe3)Nebenwirkungen Ein Medikament zur Behandlung von Depression 
steht im Verdacht, als Nebenwirkung das Reaktionsvermögen. Zehn 
zufällig ausgewählte Patienten bekamen verschiedene Dosierungen 
des Medikaments.Das Reaktionsvermögen wurde mit Hilfe eines  
Experiments gemessen (Größerer Wert = langsamerReaktionen). 
Die ergebenden Daten finden Sie in der Datendatei Nebenwirkung.rda
(in R Format)auf Moodle.

!!!!!!!!!!!!!!!!!!!!!
AM ENDE der aufgabe steht zusammengefasste regel bzw des ablaufes!!

!!!!!!!!!!!!!!!!!!!

3a)  Laden Sie die Daten in R auf:
#'

Nebenwirkungen<-load("~/EStat/R-Studio/NebenwirkungenNeu.rda")
Nebenwirkungen
#ausgabe:Nebenw
#===> DH dieses Nebenw als ausgabe wird weiter genutzt für nach-
#folgende infos/befehle die man erfahren möchte!!

#-------------------------------------------------------------------

#3b)Wie heißen die Variablen im Datensatz?
names1<-names(Nebenw)
#ausgabe: "Dosierung" "Reaktion" 

#-------------------------------------------------------------------

#3c)Erzeugen Sie die "sechs Kenngrößen Zusammenfassung" für jede 
#Variable im Datensatz.
summary(Nebenw)

'# ausgabe==>

   Dosierung        Reaktion    
 Min.   :1.100   Min.   :1.000  
 1st Qu.:2.600   1st Qu.:1.925  
 Median :4.400   Median :3.900  
 Mean   :5.120   Mean   :4.040  
 3rd Qu.:7.825   3rd Qu.:6.000  
 Max.   :9.900   Max.   :8.500 

#'
#-------------------------------------------------------------------

#3d)Stelle Reaktionsvermögen gegen Dosierung in einem Streudiagramm 
#dar. Hinweis:y-Achse gegen x-Achse
x<-Nebenw$Dosierung
y<-Nebenw$Reaktion

#==> WIR NUTZEN Nebwirk da das die ausgabe ist die wir durch den load
#befehl ausgegeben bekommen haben!! WIR arbeiten DAMIT WEITER!!!

plot (x,y)

#-------------------------------------------------------------------

'#3e)Ohne Rechnung, raten Sie approximative Werte des Abschnitts 
und der Steigung der Regressionsgerade? 
Sehr grob: die Gerade geht durch (2; 2),(4; 4) und (6; 6) d.h. 
die Gerade y=x.Vielleicht ist das zu steil als o ^b0= 0 und ^b1= 0.8.
#'

#-------------------------------------------------------------------

#3f)Erstellen Sie ein lineares Regressionsmodell mit Reaktion als 
#Zielgröße und Dosierung als Einflussgröße


lm.obj<-lm(Reaktion~Dosierung, data =Nebenw)

#-------------------------------------------------------------------

#3g)Stellen Sie die Modellzusammenfassung im Console-Fenster dar.

summary(lm.obj)

'# ausgabe:

Call:
lm(formula = Reaktion ~ Dosierung, data = Nebenw)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.99836 -0.76165 -0.01991  0.91747  2.18606 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)   
(Intercept)   0.4231     0.8762   0.483  0.64210   
Dosierung     0.7064     0.1483   4.764  0.00142 **
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 1.383 on 8 degrees of freedom
Multiple R-squared:  0.7394,	Adjusted R-squared:  0.7068 
F-statistic:  22.7 on 1 and 8 DF,  p-value: 0.00142

=======> dh 
b^0= 1.zeile (Intercept), 1.Spalte Estimate == 0.42
b^1= 2.Zeile Dosierung, 1.Spalte Estimate == 0.71

==> regressionsgerade/-fkt: f(x)= 0.42 + 0.71*x
<=> Reaktionszeit = 0.42 + 0.71 *(Dosierung)
#'

#-------------------------------------------------------------------

#3i)Ist die Steigung der Regressionsgerade statistisch signifikant?
'#
man schaut hier auf Spalte "Pr(>|t|)", Zeile "Dosierung" da man
sich NIEMALS den p-wert zur ersten zeile "(Intercept)" mit 0.05
vergleicht!
==> dh da 0.00142 < 0.05 , sind die daten statistisch signifikant
somit sind die merkmale abhängig voneinander und wir können daher
einen linearen zusammenhang zwischen den merkmalen interpretieren!
#'

#-------------------------------------------------------------------

#3j)  Fügen Sie die Regressionsgerade dem Diagramm hinzu


lm.obj<-lm(Reaktion~Dosierung, data =Nebenw)
x<-Nebenw$Dosierung
y<-Nebenw$Reaktion
plot(x,y)
abline(lm.obj,col="blue")

'#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

regel- regressionsgerade/-fkt bestimmen mit load(),dataframe,
lm() befehl

Ablauf:
1)Hochladen von datei mit load()

Nebenwirkungen<-load("~/EStat/R-Studio/NebenwirkungenNeu.rda")
Nebenwirkungen

==>ausgabe:Nebenw ==dataframe -->dh wir nutzen nur noch die ausgabe also
Nebenw für die weiteren Schritte/Infos da es unser zu nutzender
dataframe ist


2)Spaltennamen herausfinden
names(Nebenw)

==>ausgabe: "Dosierung" "Reaktion"  


3)6 kenngrößen für jede spalte bestimmen

summary(Nebenw)

==>ausgabe:
  Dosierung        Reaktion    
 Min.   :1.100   Min.   :1.000  
 1st Qu.:2.600   1st Qu.:1.925  
 Median :4.400   Median :3.900  
 Mean   :5.120   Mean   :4.040  
 3rd Qu.:7.825   3rd Qu.:6.000  
 Max.   :9.900   Max.   :8.500 


4)streudiagramm im verhältnis von Dosierung und Reaktion erstellen

x<-Nebenw$Dosierung
y<-Nebenw$Reaktion

plot (x,y)

--->wir nutzen Nebenw einfach WEITER!!das ist sehr ungewohnt aber
es ist unser dataframe


5) bestimme lineares regressionsmodell

lm.obj<-lm(Reaktion~Dosierung, data =Nebenw)

nach folgender syntax:
<NameLinearesModellAlsObjekt> <- lm(y~x, data=<NameDataFrame>)


6)modellzusammenfassung

summary(lm.obj)

==>ausgabe:
Call:
lm(formula = Reaktion ~ Dosierung, data = Nebenw)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.99836 -0.76165 -0.01991  0.91747  2.18606 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)   
(Intercept)   0.4231     0.8762   0.483  0.64210   
Dosierung     0.7064     0.1483   4.764  0.00142 **
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 1.383 on 8 degrees of freedom
Multiple R-squared:  0.7394,	Adjusted R-squared:  0.7068 
F-statistic:  22.7 on 1 and 8 DF,  p-value: 0.00142

=======> dh 
b^0= 1.zeile (Intercept), 1.Spalte Estimate == 0.42
b^1= 2.Zeile Dosierung, 1.Spalte Estimate == 0.71

==> regressionsgerade/-fkt: f(x)= 0.42 + 0.71*x
<=> Reaktionszeit = 0.42 + 0.71 *(Dosierung)


7)statistische signifikanz prüfen

man schaut hier auf Spalte "Pr(>|t|)", Zeile "Dosierung" da man
sich NIEMALS den p-wert zur ersten zeile "(Intercept)" mit 0.05
vergleicht!
  ==> dh da 0.00142 < 0.05 , sind die daten statistisch signifikant
somit sind die merkmale abhängig voneinander und wir können daher
einen linearen zusammenhang zwischen den merkmalen interpretieren!


8) regressionsgerade bestimmen

lm.obj<-lm(Reaktion~Dosierung, data =Nebenw)
x<-Nebenw$Dosierung
y<-Nebenw$Reaktion
plot(x,y)
abline(lm.obj,col="blue")

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#'



#�bung 9: simulierung, programmierung, zentraler grenzwertsatz

'#regel- binom befehle in R

1)rbinom == zuf�llige zahlen aus binomialverteilung x~B(n,p) wobei
nach jedem ausf�hren von ribinom werden immer andere zuf�llige 
zahlen ermittelt. alle Zahlen stammen aus der Menge{0,1,2,3,4,5}.

syntax rbinom: rbinom(<AnzahlZuf�lligerZahlen>, <n>, <p>)
<n> == size = Zahl der Versuche n
<p> == prob = Erfolgswahrscheinlichkeit p

bsp : rbinom(10,5,0.5)
Der Befehl generiert 10 zuf�llige Zahlen, die zu einer 
Binomialverteilung mit Parametern n=5 und p=0.5 passen:X???B(5,0.5).
Die Werte von rbinom sind zuf�llige Zahlen und sind jedes Mal anders.


2) dbinom == dichtefkt der binomialverteilung 
syntax dbinom: dbinom(x, size, prob  )
x = Zahl der Erfolge k
size = Zahl der Versuche n
prob = Erfolgswahrscheinlichkeit p

X???B(5,0.5)passt zum Zufallsexperiment also "X ist die Anzahl der 
K�pfe nach f�nf M�nzw�rfen.Die Wahrscheinlichkeiten lassen sich aus 
der Funktion dbinom() ergeben.Die Wahrscheinlichkeit, dass Kopf 
genau 3-Mal bei 5 M�nzw�rfen auftritt, ist:
 

dbinom(3,5,0.5)
ausgabe: 0.3125 ==> auch nach mehrmaligen ausf�hren selbes ergebnis


3)pbinom == Verteilungsfunktion bzw. p kumulative Dichtefunktion

syntax pbinom: pbinom(x, size, prob  )
x = Zahl der Erfolge k
size = Zahl der Versuche n
prob = Erfolgswahrscheinlichkeit p

bsp:
Die Verteilungsfunktion lasst sich mit der Funktion pbinom() 
bestimmen.Die Wahrscheinlichkeit, dass Kopf h�chstens 3-Mal bei 
5 M�nzw�rfen auftritt, ist: 
pbinom(3,5,0.5)



#'



#Aufgabe 1)Diskrete Verteilungen in R: Binomialverteilung Sei X???B(5,0.2).
dbinom(2,5,0.2)
#ausgabe: 0.2048 == gibt wahrscheinlichkeit P(X=2) aus

pbinom(2,5,0.2)
#ausgabe: 0.94208 == gibt die Wahrscheinlichkeit P(X=<2) aus


#Der folgende R-Code stellt die Wahrscheinlichkeitsfunktion und die 
#Verteilungsfunktion von X grafisch dar
plot(0:5,dbinom(0:5,5,0.2),main="test3",type="h",ylim=c(0,0.45))
#stabdiagramm wegen type="h"

plot(0:5,dbinom(0:5,5,0.2),main="test4",type="h")

plot(-1:6,pbinom(-1:6,5,0.2),main="test2",type="s",ylim=c(0,1))
#verteilungsfkt (treppen)

plot(-1:6,pbinom(-1:6,5,0.2),main="Test1",type="s")
'#

Der  Befehl dbinom(k,n,p) gibt  die  Wahrscheinlichkeit P(X=k) f�r 
X???B(n,p)aus.  Das  erste Argument k darf ein Vektor wie 0:5 sein.

Der Befehl pbinom(k,n,p) gibt die Wahrscheinlichkeit P(X=<k) f�r 
X???B(n,p) aus

#'


#Eine kleine Stichprobe aus der B(5,0.2) ist durch den folgenden 
#Befehl simuliert
Stichprobe<-rbinom(6,5,0.2)
Stichprobe

#ausgabe: nach jedem nochmaligen ausf�hren werden immer 6 verschiedene
# zufallszahlen zwischen 0 und 5 ausgegeben



#Nun simulieren Sie eine Stichprobe mit gr��erem Stichprobenumfang 
#n= 50, und die Ergebnisse in einem S�ulendiagramm grafisch darstellen.
Stichprobe<-rbinom(50,5,0.2)
plot(table(Stichprobe),type="h")



#Die empirische Verteilungsfunktion der Stichprobe ist:
plot(ecdf(Stichprobe),verticals=TRUE,do.points=FALSE)
#Wiederholen Sie diese Befehle mit einem gr��eren Stichprobenumfang. 
#Die EVF sollte die theoretischeVerteilungsfunktion oben ann�hern


'# regel- plot befehl in kombination mit *binom() befehl und table

1)plot(<WerteintervallXachse>,*binom(<AnzahlZuf�lligerZahlen>, <n>,<p>), 
      type="<Abk�rzungDiagrammart>", ylim="<WerteIntervallYachse")
      
==>ABER ylim ist garnicht n�tig!auch ohne ylim erh�lt man dasselbe
ergebnis!

2)<StichprobenName1><-*binom(<AnzahlZuf�lligerZahlen>,<n>,<p>)
plot(table(<StichprobenName1>),type="h")
==> ausgabe als stabdiagramm


abk�rzungen f�r type=" " welches diagrammart festlegt:
	
"p" for points,

"l" for lines,

"b" for both,

"c" for the lines part alone of "b",

"o" for both 'overplotted',

"h" for 'histogram' like (or 'high-density') vertical lines,

"s" for stair steps,

"S" for other steps, see 'Details' below,

"n" for no plotting.


bsp obda:

i) plot(0:5,dbinom(0:5,5,0.2),main="test3",type="h",ylim=c(0,0.45))
#stabdiagramm wegen type="h"
ODER

plot(0:5,dbinom(0:5,5,0.2),main="test4",type="h")
==> ausgabe bei beiden ist gleich


ii)plot(-1:6,pbinom(-1:6,5,0.2),main="test2",type="s",ylim=c(0,1))
#verteilungsfkt (treppen)

ODER

plot(-1:6,pbinom(-1:6,5,0.2),main="Test1",type="s")
==> ausgabe bei beiden ist gleich


iii)Stichprobe<-rbinom(50,5,0.2) -->stichprobe erzeugt mit rbinom
plot(table(Stichprobe),type="h") 

==> stichprobe wurde als stabdiagramm ausgegeben mit dem table befehl
darin


#'



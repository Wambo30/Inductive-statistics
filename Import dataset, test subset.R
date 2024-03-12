# Datensatz importierren, Test subset mit read.csv2(file())

data_csvDatei<- read.csv2("pivot_CSVDATEI",na="NA")
data2<- read.csv2(file.choose())

data3<- read.csv2(file.choose())

#wollen nun nur eine teilmenge von daten ausgeben lassen
dataOrdnen<- subset(data2, Endpreis<40.000 )
test<- subset.data.frame()

filterModell<-filter(data2, Modell==BMW)

############################################################################
#regel -eigenen datensatz manuell eintippen usw

#name<- c("Anne","Pete", "Frank","Julia","Cath")
#age<- c(28,30,21,39,35)
#child<- c(FALSE,TRUE,TRUE,FALSE,TRUE)
#height<- c(163,177,163,162,157)
#people<- data.frame(name,age,child,stringAsFactors=FALSE, height)

#Ausgabe:

#tabelle:
#  name age child height
#1  anne  28 FALSE    163
#2  pete  30  TRUE    177
#3 frank  21  TRUE    163
#4 Julia  39 FALSE    162
#5  Cath  35  TRUE    157

#==> AUFPASSEN!bool werte MÜSSEN IMMER groß geschrieben werden!!

#erweitern um eine spalte mit werten!achtung wenn werte die anzahl der 
#vorhandenen zeilen übersteigt-->keine übernahme möglich
# UND mit c ( )== beginn von vektor!!
height<- c(163,177,163,162,157)
people$height<- height
people[["height"]]<- height


#erweitern von spalte mit cbind befehl
#---> damit ist es am einfachsten!!
weight<- c(74,63,68,55,56)
cbind(people, weight)


#erweitern von zeile mit rbind befehl

tom<- data.frame(name="tom", age=37, child=FALSE, height=183)
rbind(people,tom)

#nutzung von order
#tabelle:
#  name age child height
#1  anne  28 FALSE    163
#2  pete  30  TRUE    177
#3 frank  21  TRUE    163
#4 Julia  39 FALSE    162
#5  Cath  35  TRUE    157
  

#ranks<- order(people$age)
#> ranks
#ausgabe--> 3 1 2 5 4

#--> das heißt in der 3.zeile ist das kleinste alter, in 1.zeile das zweit
#kleinste alter usw...


#nutzung von sort
# sort(people$age)
# ausgabe: 21 28 30 35 39

#ausgabe von einer spalte
#people$age
#ausgabe: 28 30 21 39 35

#zeile und spalte ausgeben lassen
#> people[3,2]
#ausgabe: 21
#==> syntax: 
#1)<nameDatensatz>[<ZeilenZahl>,<SpaltenZahl>]
#2)<nameDatensatz>[<Zeilen>,<NameSpalte>] 
#3)<nameDatensatz>[<NameZeile>,<Spaltenzahl>]
#bsp2: people[3,"age"]
#ausgabe: 21


#nur spalte ausgeben
#people[,"age"]
#ausgabe:28 30 21 39 35
#dh ALLE daten aus der spalte age werden ausgegeben

#nur zeile ausgeben
#people[2,]
#ausgabe: 
#name age child height
#2 pete  30  TRUE    177

#==> dh komplette 2. zeile mit deren überschriften werden ausgegeben

#bsp obda 1:
# wollen ne zusammenfassung der grundaussagen haben bzgl einer spalte
# summary(age)
#ausgabe: 
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#21.0    28.0    30.0    30.6    35.0    39.0
#==> dh min,max,median usw sind man als übersicht!


#############################################################################

#regel-wie man plottet allgemein

#bsp obda 1:
#plot(1:10, type="l" , main="gerade von 1 bis 10")

#==> dh es wird ne gerade von 1 bis 10 (x,y element[1,10] ) gebildet
#syntax: plot(<ZahlDatensatz>, type="<WieDatenDargestelltWerdenSollen>", 
#       main="<Überschrift")

#==> dh der zahldatensatz ist kein richtiger wie man das mit zeilen und spalten
#kennt!

#bsp obda 2:
#wir nutzen einen richtigen datensatz mit zeilen und spalten
# 1) attach (data2) 
#2) plot(Modell) 
#warum modell? da es eine spalte in dem datensatz data2 ist! man kann auch 
#alles plotten lassen was aber zu unübersichtlich wäre!


#bsp obda 3:
#plotten daten von zwei spalten wobei eines jene daten zur x achse und das
#andere zur y achse darstellt

#plot(height, age) --> sind beides jeweils spalten wobei dann punkt grafik
#kommt

#ODER plot(height ~ age)--> stellt verhältnis beider daten dar, weiss aber
#nicht wie! beide grafiken sehen identisch aus


#bsp obda 4:
#wollen boxplot erstellen-> ist ähnlich wie bei normalem
# boxplot(age, height, main="boxplot bzgl alter", xlab="Alter", ylab="Größen", 
# col="green")
# age== werte für x achse, height== werte für y achse
#xlab== beschriftung x achse, ylab== beschriftung y achse
#col== gibt farbe innerhalb des boxplots an
#=====> die mittlere linie im boxplot ist dann der mittelwert!


#bsp obda 5:
#ausgeben einer einfachen kurve mit fktsvorschrift, default einstellung ist
#das die werte zwischen 0 bis 1 ausgegeben werden

#curve(x^2, xlim=c(1,10)) --> xlim== festlegung der werte auf x achse mit dem
#intervall 1 bis 10
#ODER wir schreiben
#curve(x^2, 1,10) --> OHNE das schlüsselwort xlim


##############################################################################



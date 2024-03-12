#virtueller Würfel

# n=36 mit wirtuellen Würfel gewürfelt

#Werte Stichprobe
StichprobeStudent<- c(1,1,1,1,1,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,6,6,6,6,6,6,6)

StichprobeStudent

#zusammenfassung Stichprobe
table(StichprobeStudent)

#Mittelwert
Mittelwert<-mean(StichprobeStudent)
#ausgabe: 3.5

#stichprobenstandardabweichung
standardabw<-sd(StichprobeStudent)
#ausgabe: 1.63

#untere Grenze von KI
untere<- Mittelwert - 1.69*(standardabw/6)
#ausgabe: 3.040862


#obere Grenze von KI
obere<- Mittelwert + 1.69*(standardabw/6)
#ausgabe: 3.959138

'# meine Ergebnisse zusammengefasst:

Kenngröße                           

Mittelwert == 3.5

Stichprobenstandardabweichung == 1.63

Untere Grenze KI == 3.040862

Obere Grenze KI == 3.959138


Vertrauensbereich von Herrn Prof. Downie: [3.41, 4.43]
Mein Vertrauensbereich: [3.04, 3.96]

Ich glaube der Erwartungswert liegt zwischen 3.04 und 3.96 .

#'
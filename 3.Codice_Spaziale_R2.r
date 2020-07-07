
FR#Richiamiamo la libreria sp - precedentemente installata con “install.packages("sp”)”
library(sp)

FR#Carichiamo i nostri dati 
data(meuse)

FR#fissiamo il dataframe 
attach(meuse)

FR#mostriamo le prime 6 righe della tabella 
head(meuse)

FR#si può usare anche  il comando names(meuse)

FR#andiamo a specificare la presenza di coordinate
coordinates(meuse)=~x+y

FR#creiamo un spplot considerando lo zinco 
spplot(meuse,"zinc")

FR#esercizio : creare un spplot del rame
spplot(meuse,"copper")

FR#”bubble” varia il grafico -> BOLLE 
bubble(meuse,"zinc")

FR#esercizio: cambiamo il colore del grafico e lo facciamo mettendo in evidenza il Rame 
bubble(meuse,"copper",col = “red)

FR#creiamo un nuovo oggetto con dei dati inventati

foram <- c(10,20,35,55,67,80)
carbon <- c(5, 15, 30, 70, 85, 99)

FR#facciamo un plot con i dati inventati
plot(carbon,foram,col=“green”, cex=2, pch=19)

FR#scarichiamo un nuovo pacchetto dati, e lo installiamo seguendo il percorso file, import dataset, from text(base), e scegliamo il file di interesse se usiamo Rstudio

setwd("/Users/Name/Desktop/nome cartella")

prof#siccome la prima riga non è di dati ma di testo si usa questo comando - se si usa R studio questo passaggio lo fa in automatico
covid <- read.table("covid_agg.csv",header = T)

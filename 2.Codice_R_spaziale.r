FR#carichiamo il pacchetto sp - già precedentemente scaricato
library(sp)

FR#”data” per aprire il nostro dataframe
data(meuse)

FR#”head” vediamo i primi 6 
head(meuse)

FR#usiamo attach per fissare il dataframe
attach(meuse)

FR#facciamo un plot per mettere in correlazione cadmio e piombo
plot(cadmium,lead,main="Relazione cadmio e piombo",col="red",pch=18,xlab="Cadmio",ylab="Piombo")

FR#esercizio : creare un plot con rame e zinco
plot(copper,zinc,main="Relazione tra Rame e Zinco",col="green",pch=17,xlab="Rame",ylab="Zinco")

FR#per mostrare i grafici assieme usiamo  “multiframe” o “multipanel”
par(mfrow=c(1,2))
plot(cadmium,lead,main="Relazione cadmio e piombo",col="red",pch=18,xlab="Cadmio",ylab="Piombo")
plot(copper,zinc,main="Relazione tra Rame e Zinco",col="green",pch=17,xlab="Rame",ylab="Zinco")

FR#se cambiamo i valori di mfrow in 2,1 avremo una variazione nella visualizzazione del grafico

FR#installiamo nuovo pacchetto
 install.packages("GGally")

FR#una volta installato chiamiamo la libreria
library(GGally)

FR#ggpairs(meuse) fa il grafico con tutte le variabili - usiamo ggpairs(meuse[,3:6]) per prendere solo le variabili di interesse
ggpairs(meuse[,3:6])


FR#spieghiamo ad R che nei dati sono presenti coordinate
coordinates(meuse)=~x+y

FR#”plot” serve sempre per creare il grafico 
plot(meuse)

FR#per creare il grafico di tipo SPAZIALE si usa questa funzione:

spplot(meuse,"zinc")

FR# il plot che è uscito è di tipo spaziale i punti gialli ci vanno ad indicare le zone più inquinate, stiamo analizzando le zone vicine ad un fiume

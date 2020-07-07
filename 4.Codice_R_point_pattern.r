FR#codice per analisi dei pattern legati ai punti

FR#impostiamo la set working directory
setwd("/Users/Flavia/ecologia del paesaggio")

install.packages("ggplot2")
install.packages("spatstat")

 library(ggplot2) 
FR#comando alternativo require(ggplot2)
 library(spatstat)

FR#cambiamo il nome
covid <- covid_agg

FR#importiamo i dati
covid <- read.table("covid_agg.csv",header = T)

FR#prime sei righe della tabella
head(covid)

FR#creiamo un plot per iniziare a vedere la disposizione
plot(covid$country,covid$cases)
FR# attach(covid) 
FR# plot(country,cases)

FR#con las vediamo i lables 
FR#con las=0 rimangono parallele
FR#con las=1 cambia le etichette in orizzontale 
FR#con las =2 le lables sono perpendicolari all'asse 
FR#con las=3 le lables sono tutte verticali

plot(covid$country,covid$cases,las=0)
plot(covid$country,covid$cases,las=1)
plot(covid$country,covid$cases,las=2)
plot(covid$country,covid$cases,las=3)

plot(covid$country,covid$cases,las=3,cex.lab=0.5, cex.axis=0.5) 
FR# vertical labels

FR#ggplot2

FR#chiamiamo i dati nella libreria
data(mpg)
head(mpg)

FR#creiamo un plot del nuovo dataset mgp - modifichiamo l'estetica e aggiungiamo una geometria
ggplot(mpg,aes(x=displ,y=hwy))+geom_point()
ggplot(mpg,aes(x=displ,y=hwy)) + geom_line()
ggplot(mpg,aes(x=displ,y=hwy)) + geom_polygon()

FR# ggplot di covid
ggplot(covid,aes(x=lon,y=lat,size=cases)) + geom_point()

FR#density
FR#scarichiamo e installiamo la nuova libreria spatstat
library(spatstat)
attach(covid)

FR#tramite la funzione ppp ci creiamo un nuovo dataset che ci interesserà per l'analisi spaziale
covids <- ppp(lon,lat,c(-180,180),c(-90,90))

FR#semplifichiamo la densità chiamandola d
d <- density(covids)

FR#facciamo un plot di d
plot(d)

FR#aggiungiamo i punti al plot
points(covids)

FR#salviamo il file in .Rdata

setwd("/Users/Flavia/ecologia del paesaggio")
load(“point_pattern.RData”)

FR#cambiamo ColorRampPalette - il numero di livelli si specifica con una parentesi esterna - per usare questa funzione usiamo la libreria spatstat
cl <- colorRampPalette(c("yellow","orange","red"))(100)
plot(d,col=cl)

FR#esercizio: cambiamo i colori del grafico in blu e verde
cl2 <- colorRampPalette(c(“dark green”,”light green”,”blue"))(100)
plot(d,col=cl2)

points( covids)

FR#per completare la mappa aggiungiamo i bordi dei vari paesi; usiamo la libreria rgdal, scarichiamo un nuovo pacchetto di dati delle coste in vettore
library(rgdal)
coastlines <- readOGR("ne_10m_coastline.shp")

FR#per avere il nostro grafico completo useremo questo comando;
plot(coastlines, add=T)

FR# Esercizio : plot della mappa di densità con una nuova colorazione, e aggiunta delle coastlines
  cl <- colorRampPalette(c('blue','light blue','light green','yellow')) (100)
  plot(d, col=cl)
  plot(coastlines, add=T, col="yellow")

  cl2 <- colorRampPalette(c('red','orange','yellow','green', 'blue')) (800)
  plot(d, col=cl2)
  plot(coastlines, add=T)

  cl3 <- colorRampPalette(c('green', 'violet', 'blue')) (200)
  plot(d, col=cl3)
  plot(coastlines, add=T)

  cl4 <- colorRampPalette(c('violet','yellow','green'))(100)
  plot(d, col=cl4)
  plot(coastlines, add=T)

  cl5 <- colorRampPalette(c('darkcyan', 'purple', 'red')) (200) 
  plot(d, col=cl5)
  plot(coastlines, add=T)

  cl6 <- colorRampPalette(c('darkcyan', 'purple', 'red')) (200) 
  plot(d, col=cl6)
  plot(coastlines, add=T)

  cl7<-colorRampPalette(c('white','blue','green','red','orange','yellow')) (150)
  plot(d, col=cl7)
  plot(coastlines, add=T)

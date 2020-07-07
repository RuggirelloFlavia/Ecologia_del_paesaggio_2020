#installiamo i pacchetti che ci servono

install.packages("sp")
library(sp) 

# “data” serve per chiamare i dati contenuti nella libreria
data("meuse")

#”meuse” vediamo il contenuto
meuse

#vediamo solo le prime 6 righe della tabella
head(meuse)

#”names “ serve per vedere i nomi delle variabili contenute all'interno della tabella
names(meuse)

#summary è una funzione generica utilizzata per avere una sintesi dei risultati di varie altre funzioni
summary(meuse)

#”pairs” crea un grafico che mette in relazione le variabili dei nostri dati
pairs(meuse)

#il simbolo messo prima di cadmium ci fa mettere in correlazione solamente le variabili da noi specificate - impostando i dati uguali a meuse
pairs(~cadmium+copper+lead,data=meuse)

pairs(~cadmium+copper+lead+zinc,data = meuse)

#metodo alternativo se siamo interessati a determinate righe
pairs(meuse[,3:6])

# col="red", cambia il colore del grafico
pairs(meuse[,3:6],col="red")

# “main” lo utilizziamo per dare un titolo al grafico
pairs(meuse[,3:6],col="purple",pch=19,cex=3, main="Elementi presenti")

pairs(~cadmium+copper+lead+zinc+elev,data = meuse) 

#prendiamo delle funzioni esterne;
panel.correlations <- function(x, y, digits=1, prefix="", cex.cor)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r1=cor(x,y,use="pairwise.complete.obs")
  r <- abs(cor(x, y,use="pairwise.complete.obs"))
  
  
  
  txt <- format(c(r1, 0.123456789), digits=digits)[1]
  txt <- paste(prefix, txt, sep="")
  if(missing(cex.cor)) cex <- 0.9/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex * r)
}



panel.smoothing <- function (x, y, col = par("col"), bg = NA, pch = par("pch"),
                             cex = 1, col.smooth = "red", span = 2/3, iter = 3, ...)
{
  points(x, y, pch = pch, col = col, bg = bg, cex = cex)
  ok <- is.finite(x) & is.finite(y)
  if (any(ok))
    lines(stats::lowess(x[ok], y[ok], f = span, iter = iter),
          col = 1, ...)
}




panel.histograms <- function(x, ...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(usr[1:2], 0, 1.5) )
  h <- hist(x, plot = FALSE)
  breaks <- h$breaks; nB <- length(breaks)
  y <- h$counts; y <- y/max(y)
  rect(breaks[-nB], 0, breaks[-1], y, col="white", ...)
}


pairs(~cadmium+copper+lead+zinc+elev,data = meuse) 

#una volte inviate le tre funzioni esterne potremo creare dei grafici diversi ed esteticamente più belli
pairs(meuse[,3:6],lower.panel = panel.correlations,upper.panel = panel.smoothing,diag.panel = panel.histograms)

#exercise: varia il pannello superiore ed inferiore invertendoli
pairs(meuse[,3:6],lower.panel = panel.smoothing,upper.panel = panel.correlations,diag.panel = panel.histograms)

library(sp)
data("meuse")
 #testa di meuse
head(meuse) 

#creiamo un grafico prendendo le colonne di interesse usando il comando “meuse$”
plot(meuse$cadmium,meuse$copper, main="cadmio e rame correlati")

#mette in evidenza il nostro pacchetto di dati 
attach(meuse)

# messo in evidenza meuse non dobbiamo  scriverlo ogni volta 
plot(cadmium,copper, main="Cadmio e Rame",pch=24,col="purple",xlab="Cadmio",ylab="Rame",cex=2)

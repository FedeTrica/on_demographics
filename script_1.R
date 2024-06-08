library(sf)
library(tidyverse)
library(ggplot2)
library(leaflet)
library(tmap)

#read a geojson
fecund<-st_read('fecund_2010.geojson')

#consultar la estructura
glimpse(fecund)
str(fecund)

#fecundidad global mayor que 0  
fecund2<-filter(fecund, ff_tgf > 0)
#paleta de visualizacion
pal <- colorNumeric("viridis", NULL)


# #mapa
# leaflet(fecund2) %>%
#   addTiles() %>%
#   setView(-62.70, -26.14, zoom = 5) %>%
#   addPolygons(stroke = FALSE, 
#               smoothFactor = 0.3, 
#               fillOpacity = 1,
#               fillColor = ~pal(ff_tgf)) %>%
#   addLegend(pal = pal, 
#             values=fecund2$ff_tgf, 
#             na.label="NA")
# 
# mapa_fecund2
##---
  
#mapa2 con Tmap
#TMap requiere un .shp 
mapa <- tm_shape(fecund)+
  tm_fill
mapa
#Graficos
help(hist)
help(plot, colors)

#boxplot
grafico1 <- ggplot(fecund2, aes(ff_tgf))+
  geom_boxplot()
grafico1

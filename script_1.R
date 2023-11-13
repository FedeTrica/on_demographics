library(sf)
library(tidyverse)
library(ggplot2)
library(leaflet)
fecund<-st_read('fecund_2010.geojson')

fecund2<-filter(fecund, ff_tgf > 0)
pal <- colorNumeric("viridis", NULL)

leaflet(fecund2) %>%
  addTiles() %>%
  setView(-62.70, -26.14, zoom = 5) %>%
  addPolygons(stroke = FALSE, 
              smoothFactor = 0.3, 
              fillOpacity = 1,
              fillColor = ~pal(ff_tgf)) %>%
  addLegend(pal = pal, 
            values=fecund2$ff_tgf, 
            na.label="NA")
 
##---
  

help(hist)
help(plot, colors)

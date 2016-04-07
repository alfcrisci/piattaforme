library(maptools)
library(sp)
library(mapview)
library(htmlwidgets)
library(rgdal)
library(geojsonio)


piattaforme=read.csv("data/piattaforme.csv")
piattaforme$Longitudine=as.numeric(as.character(piattaforme$Longitudine))
piattaforme$Latitudine=as.numeric(as.character(piattaforme$Latitudine))

coordinates(piattaforme) =~Longitudine+Latitudine
proj4string(piattaforme) <- CRS("+init=epsg:4326")
writeOGR(piattaforme, ".", "piattaforme", driver="ESRI Shapefile",overwrite_layer = T)
saveRDS(piattaforme,"piattaforme_datiMISE.rds")

geojson_write(piattaforme, lat='lat', lon='long')

piatt=mapview(piattaforme)

saveWidget(piatt@map,"piattaforme.html")

#install.packages("tidyverse")
#install.packages("sf")
library(tidyverse)
library(sf)
deptos <- read_sf("map/COL_adm1.shp")
st_crs(deptos)
ggplot() + geom_sf(data = deptos, fill="darkseagreen")

# convertir el objeto deptos en un sistema coordenado de referencias
deptos_utm <- st_transform(deptos, crs = st_crs(32618))
deptos_utm

ggplot() + geom_sf(data = deptos_utm, fill="palegreen3")


cundinamarca <-  deptos %>%   filter(NAME_1 == "Cundinamarca")
ggplot() + geom_sf(data = cundinamarca, fill="plum1") 

municipios <- read_sf("map/COL_adm2.shp")
municipios


#-------------------------------------------------------------------------------
mun_cundi <- municipios %>% filter(NAME_1 == "Cundinamarca")
ggplot() + geom_sf(data = mun_cundi, fill="orchid1") 


mun_cundi

cundinamarca_points<- st_centroid(mun_cundi)
cundinamarca_points <- cbind(mun_cundi, st_coordinates(st_centroid(mun_cundi$geometry)))

ggplot(cundinamarca) +
  geom_sf() +
  geom_sf(data = cundinamarca_points, fill = "lightpink") + 
  geom_text(data = cundinamarca_points, aes(x=X, y=Y,label = ID_2), size = 1) +
  coord_sf(xlim = c(-75.2, -72.7), ylim = c(3.5, 6), expand = FALSE)
#-------------------------------------------------------------------------------
#install.packages("scales")
library(scales)

ggplot(cundinamarca) + 
  geom_sf(data=cundinamarca_points, 
          aes(x=X, y=Y, fill = ID_2), 
          color = "black", 
          size = 0.25) +
  geom_text(data = cundinamarca_points, aes(x=X, y=Y,label = ID_2), size = 1) +
  theme(aspect.ratio=1)+
  scale_fill_distiller(name="ID_2", palette = "BuPu", breaks = pretty_breaks(n = 5))+
  labs(title="Mapa de Cundinamarca")

ggsave("cundinamarca_municipios.pdf")

#------------------------------------------------------------------------------
# install.packages("leaflet")
library(leaflet)
cun_points <- as(cundinamarca_points, 'Spatial')

# install.packages("lwgeom")
library(lwgeom)
mun_cundi$area <- st_area(mun_cundi)
mun_cundi$km2 <- mun_cundi$area/(1000000)
mun_cundi$km2

cun_mun <- as(mun_cundi, 'Spatial')
bins <- c(0, 50, 100, 200, 300, 500, 1000, 2000, Inf)
pal <- colorBin("YlOrRd", domain = cun_mun$km2, bins = bins)


labels <- mun_cundi$NAME_2
labels


m <- leaflet(cun_mun) %>%
  setView(-75.5, 7, 8)  %>% addPolygons(
    fillColor = ~pal(km2),
    weight = 2,
    opacity = 1,
    color = "black",
    dashArray = "3",
    fillOpacity = 0.7,
    highlight = highlightOptions(
      weight = 5,
      color = "PuRd",
      dashArray = "",
      fillOpacity = 0.7,
      bringToFront = TRUE),
    label = labels) %>%
  addLegend(pal = pal, values = ~km2, opacity = 0.7, title = "Cundimarca_Área",
            position = "bottomright")

m


leaflet() %>%
  addProviderTiles(providers$Esri.NatGeoWorldMap, options= providerTileOptions(opacity = 1)) %>%
  addPolygons(data = cun_mun, popup= cun_mun$NAME_2, 
              stroke = TRUE, fillOpacity = 0.25, smoothFactor = 1, weight = 2
  )


#-------------------------------------------------------------------------


bogota <- municipios %>% filter(NAME_2 == "Santafé de Bogotá")
ggplot() + geom_sf(data = bogota, fill="orchid")

leaflet() %>%
  addProviderTiles(providers$Esri.NatGeoWorldMap, options= providerTileOptions(opacity = 0.99)) %>%
  addPolygons(data = bogota, popup= bogota$NAME_2,
              stroke = TRUE, fillOpacity = 0.25, smoothFactor = 0.25, weight = 2
  )

#---------------------------------------------------------------------------




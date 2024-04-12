library(readr)
require(sp)
#require(rgdal)
require(raster)
require(RColorBrewer)

vsex2021 <- read_csv("data/violencia_sex_2021.csv")
# Suponiendo que tu base de datos se llama 'datos' y tiene una columna 'departamento' y una columna 'tasa'
# Sumar la variable 'tasa' por 'departamento' usando tapply
vsex21 = data.frame(casos <- tapply(vsex2021$casos, vsex2021$cdep, sum),
                    casosm <- tapply(vsex2021$casosm, vsex2021$cdep, sum),
                    casosh <- tapply(vsex2021$casosh, vsex2021$cdep, sum)) 

# Crear la variable departamento basada en los nombres de fila
vsex21$departamento <- rownames(vsex21)
names(vsex21) = c("casos", "casosm", "casosh","cdep")
vsex21$cdep[c(1,2)] =c("05","08")
# Mostrar el resultado

dptos21 <- data.frame(id = 1:33,
                    ndep =c("ANTIOQUIA","ATLANTICO","SANTAFE DE BOGOTA D.C", "BOLIVAR","BOYACA", "CALDAS","CAQUETA","CAUCA", "CESAR", "CORDOBA","CUNDINAMARCA", "CHOCO","HUILA", "LA GUAJIRA", "MAGDALENA","META","NARIÑO","NORTE DE SANTANDER","QUINDIO","RISARALDA", "SANTANDER", "SUCRE","TOLIMA", "VALLE DEL CAUCA","ARAUCA", "CASANARE", "PUTUMAYO", "AMAZONAS", "GUAINIA",  "GUAVIARE", "VAUPES", "VICHADA", "ARCHIPIELAGO DE SAN ANDRES PROVIDENCIA Y SANTA CATALINA"),
                    cdep =c("05","08","11","13","15","17","18","19","20","23","25","27","41","44","47","50","52","54","63","66","68","70","73","76","81","85","86","91","94","95","97","99","88")
)
# Merge de dptos con vsex21
dptos21 <- merge(dptos21, vsex21, by.x = "cdep", by.y = "cdep", all.x = TRUE)

write_csv(dptos21, "data/dptos21.csv")

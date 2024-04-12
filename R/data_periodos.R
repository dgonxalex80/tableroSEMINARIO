library(readr)
vsex <- read_csv("data/vsex.csv")


dptos <- data.frame(id = 1:33,
                    ndep =c("ANTIOQUIA","ATLANTICO","BOGOTA D.C", "BOLIVAR","BOYACA", 
                            "CALDAS","CAQUETA","CAUCA", "CESAR", "CORDOBA","CUNDINAMARCA", 
                            "CHOCO","HUILA", "LA GUAJIRA", "MAGDALENA","META","NARIÑO",
                            "NT.SANTANDER","QUINDIO","RISARALDA", "SANTANDER", "SUCRE",
                            "TOLIMA", "VALLE","ARAUCA", "CASANARE", "PUTUMAYO", "AMAZONAS", 
                            "GUAINIA",  "GUAVIARE", "VAUPES", "VICHADA", "SAN ANDRES"),
                    cdep =c("05","08","11","13","15","17","18","19","20","23","25","27","41","44","47","50","52","54","63","66","68","70","73","76","81","85","86","91","94","95","97","99","88")
)

library(dplyr)


sex11 <- subset(vsex, vsex$periodo ==2011)
sex12 <- subset(vsex, vsex$periodo ==2012)
sex13 <- subset(vsex, vsex$periodo ==2013)
sex14 <- subset(vsex, vsex$periodo ==2014)
sex15 <- subset(vsex, vsex$periodo ==2015)
sex16 <- subset(vsex, vsex$periodo ==2016)
sex17 <- subset(vsex, vsex$periodo ==2017)
sex18 <- subset(vsex, vsex$periodo ==2018)
sex19 <- subset(vsex, vsex$periodo ==2019)
sex20 <- subset(vsex, vsex$periodo ==2020)
sex21 <- subset(vsex, vsex$periodo ==2021)
sex22 <- subset(vsex, vsex$periodo ==2022)



write_csv(sex11, "data/sex11.csv")
write_csv(sex12, "data/sex12.csv")
write_csv(sex13, "data/sex13.csv")
write_csv(sex14, "data/sex14.csv")
write_csv(sex15, "data/sex15.csv")
write_csv(sex16, "data/sex16.csv")
write_csv(sex17, "data/sex17.csv")
write_csv(sex18, "data/sex18.csv")
write_csv(sex19, "data/sex19.csv")
write_csv(sex20, "data/sex20.csv")
write_csv(sex21, "data/sex21.csv")
write_csv(sex22, "data/sex22.csv")
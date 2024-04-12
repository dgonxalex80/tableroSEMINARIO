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

tasa11 <- tapply(sex11$tasa, sex11$cdep, sum) ;dep11 <- rownames(tasa11)
tasa12 <- tapply(sex12$tasa, sex12$cdep, sum) ;dep12 <- rownames(tasa12)
tasa13 <- tapply(sex13$tasa, sex13$cdep, sum) ;dep13 <- rownames(tasa13) 
tasa14 <- tapply(sex14$tasa, sex14$cdep, sum) ;dep14 <- rownames(tasa14)
tasa15 <- tapply(sex15$tasa, sex15$cdep, sum) ;dep15 <- rownames(tasa15)
tasa16 <- tapply(sex16$tasa, sex16$cdep, sum) ;dep16 <- rownames(tasa16)
tasa17 <- tapply(sex17$tasa, sex17$cdep, sum) ;dep17 <- rownames(tasa17)
tasa18 <- tapply(sex18$tasa, sex18$cdep, sum) ;dep18 <- rownames(tasa18)
tasa19 <- tapply(sex19$tasa, sex19$cdep, sum) ;dep19 <- rownames(tasa19)
tasa20 <- tapply(sex20$tasa, sex20$cdep, sum) ;dep20 <- rownames(tasa20)
tasa21 <- tapply(sex21$tasa, sex21$cdep, sum) ;dep21 <- rownames(tasa21)
tasa22 <- tapply(sex22$tasa, sex22$cdep, sum) ;dep22 <- rownames(tasa22)

vsex11 <- data.frame(dep11,tasa11) ; vsex11$dep11[c(1,2)] =c("05","08")
vsex12 <- data.frame(dep12,tasa12) ; vsex12$dep12[c(1,2)] =c("05","08")
vsex13 <- data.frame(dep13,tasa13) ; vsex13$dep13[c(1,2)] =c("05","08")
vsex14 <- data.frame(dep14,tasa14) ; vsex14$dep14[c(1,2)] =c("05","08")
vsex15 <- data.frame(dep15,tasa15) ; vsex15$dep15[c(1,2)] =c("05","08")
vsex16 <- data.frame(dep16,tasa16) ; vsex16$dep16[c(1,2)] =c("05","08")
vsex17 <- data.frame(dep17,tasa17) ; vsex17$dep17[c(1,2)] =c("05","08")
vsex18 <- data.frame(dep18,tasa18) ; vsex18$dep18[c(1,2)] =c("05","08")
vsex19 <- data.frame(dep19,tasa19) ; vsex19$dep19[c(1,2)] =c("05","08")
vsex20 <- data.frame(dep20,tasa20) ; vsex20$dep20[c(1,2)] =c("05","08")
vsex21 <- data.frame(dep21,tasa21) ; vsex21$dep21[c(1,2)] =c("05","08")
vsex22 <- data.frame(dep22,tasa22) ; vsex22$dep22[c(1,2)] =c("05","08")

# Merge de dptos con vsex21
dptos <- merge(dptos, vsex11, by.x = "cdep", by.y = "dep11", all.x = TRUE)
dptos <- merge(dptos, vsex12, by.x = "cdep", by.y = "dep12", all.x = TRUE)
dptos <- merge(dptos, vsex13, by.x = "cdep", by.y = "dep13", all.x = TRUE)
dptos <- merge(dptos, vsex14, by.x = "cdep", by.y = "dep14", all.x = TRUE)
dptos <- merge(dptos, vsex15, by.x = "cdep", by.y = "dep15", all.x = TRUE)
dptos <- merge(dptos, vsex16, by.x = "cdep", by.y = "dep16", all.x = TRUE)
dptos <- merge(dptos, vsex17, by.x = "cdep", by.y = "dep17", all.x = TRUE)
dptos <- merge(dptos, vsex18, by.x = "cdep", by.y = "dep18", all.x = TRUE)
dptos <- merge(dptos, vsex19, by.x = "cdep", by.y = "dep19", all.x = TRUE)
dptos <- merge(dptos, vsex20, by.x = "cdep", by.y = "dep20", all.x = TRUE)
dptos <- merge(dptos, vsex21, by.x = "cdep", by.y = "dep21", all.x = TRUE)
dptos <- merge(dptos, vsex22, by.x = "cdep", by.y = "dep22", all.x = TRUE)

namdep <-names(dptos)
names(dptos) <- c("cdep", "id", "ndep", 2011:2022)
dptos[30,7] = 0
dptos[32,c(7,8,9)] = 0

write_csv(dptos, "data/data_tasa.csv")

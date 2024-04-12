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


sex11$casosh <- as.numeric(sex11$casosh)
sex12$casosh <- as.numeric(sex12$casosh)
sex13$casosh <- as.numeric(sex13$casosh)
sex14$casosh <- as.numeric(sex14$casosh)
sex15$casosh <- as.numeric(sex15$casosh)
sex16$casosh <- as.numeric(sex16$casosh)
sex17$casosh <- as.numeric(sex17$casosh)
sex18$casosh <- as.numeric(sex18$casosh)
sex19$casosh <- as.numeric(sex19$casosh)
sex20$casosh <- as.numeric(sex20$casosh)
sex21$casosh <- as.numeric(sex21$casosh)
sex22$casosh <- as.numeric(sex22$casosh)







casos11 <- tapply(sex11$casosh, sex11$cdep, sum) ;dep11 <- rownames(casos11)
casos12 <- tapply(sex12$casosh, sex12$cdep, sum) ;dep12 <- rownames(casos12)
casos13 <- tapply(sex13$casosh, sex13$cdep, sum) ;dep13 <- rownames(casos13) 
casos14 <- tapply(sex14$casosh, sex14$cdep, sum) ;dep14 <- rownames(casos14)
casos15 <- tapply(sex15$casosh, sex15$cdep, sum) ;dep15 <- rownames(casos15)
casos16 <- tapply(sex16$casosh , sex16$cdep, sum) ;dep16 <- rownames(casos16)
casos17 <- tapply(sex17$casosh,  sex17$cdep, sum) ;dep17 <- rownames(casos17)
casos18 <- tapply(sex18$casosh, sex18$cdep, sum) ;dep18 <- rownames(casos18)
casos19 <- tapply(sex19$casosh, sex19$cdep, sum) ;dep19 <- rownames(casos19)
casos20 <- tapply(sex20$casosh, sex20$cdep, sum) ;dep20 <- rownames(casos20)
casos21 <- tapply(sex21$casosh, sex21$cdep, sum) ;dep21 <- rownames(casos21)
casos22 <- tapply(sex22$casosh, sex22$cdep, sum) ;dep22 <- rownames(casos22)

vsex11 <- data.frame(dep11,casos11) ; vsex11$dep11[c(1,2)] =c("05","08")
vsex12 <- data.frame(dep12,casos12) ; vsex12$dep12[c(1,2)] =c("05","08")
vsex13 <- data.frame(dep13,casos13) ; vsex13$dep13[c(1,2)] =c("05","08")
vsex14 <- data.frame(dep14,casos14) ; vsex14$dep14[c(1,2)] =c("05","08")
vsex15 <- data.frame(dep15,casos15) ; vsex15$dep15[c(1,2)] =c("05","08")
vsex16 <- data.frame(dep16,casos16) ; vsex16$dep16[c(1,2)] =c("05","08")
vsex17 <- data.frame(dep17,casos17) ; vsex17$dep17[c(1,2)] =c("05","08")
vsex18 <- data.frame(dep18,casos18) ; vsex18$dep18[c(1,2)] =c("05","08")
vsex19 <- data.frame(dep19,casos19) ; vsex19$dep19[c(1,2)] =c("05","08")
vsex20 <- data.frame(dep20,casos20) ; vsex20$dep20[c(1,2)] =c("05","08")
vsex21 <- data.frame(dep21,casos21) ; vsex21$dep21[c(1,2)] =c("05","08")
vsex22 <- data.frame(dep22,casos22) ; vsex22$dep22[c(1,2)] =c("05","08")

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
#dptos[30,7] = 0
#dptos[32,c(7,8,9)] = 0

write_csv(dptos, "data/dptos_h.csv")

library(poliscidata)


df <- world

latin_america_paises<-c("Argentina", "Brazil", "Bolivia", "Chile", "Colombia", "Costa Rica", "Cuba", "Dominican Republic", "Ecuador", "El Salvador", "Guatemala", "Haiti", "Honduras", "Mexico", "Nicaragua", "Panama", "Paraguay", "Peru", "Uruguay", "Venezuela")

dflatin <- df %>% filter(country %in% latin_america_paises)

dflatinok <- dflatin %>% filter(gini10>=0)
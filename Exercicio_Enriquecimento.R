library(poliscidata)

df <- world
latin_america_paises<-c("Argentina", "Brazil", "Bolivia", "Chile", "Colombia", "Costa Rica", "Cuba", "Dominican Republic", "Ecuador", "El Salvador", "Guatemala", "Haiti", "Honduras", "Mexico", "Nicaragua", "Panama", "Paraguay", "Peru", "Uruguay", "Venezuela")
dflatin <- df %>% filter(country %in% latin_america_paises)
dflatinok <- dflatin %>% filter(gini10>=0)



#juntar tabela que contém informações do índice gini10 com a do IDH
hdi <- read.csv2('bases_originais/hdi-ok.csv')
hdilatin <- hdi %>% 
  filter(country %in% latin_america_paises)

idhginilatin <- left_join(dflatinok, hdilatin, by = c('country' = 'country'))

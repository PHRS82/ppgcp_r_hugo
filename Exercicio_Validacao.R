library(data.table)
library(dplyr)
library(tidyverse)
library(validate)

#criação das bases
df <- world
latin_america_paises<-c("Argentina", "Brazil", "Bolivia", "Chile", "Colombia", "Costa Rica", "Cuba", "Dominican Republic", "Ecuador", "El Salvador", "Guatemala", "Haiti", "Honduras", "Mexico", "Nicaragua", "Panama", "Paraguay", "Peru", "Uruguay", "Venezuela")
dflatin <- df %>% filter(country %in% latin_america_paises)
dflatinok <- dflatin %>% filter(gini10>=0)
hdi <- read.csv2('bases_originais/hdi-ok.csv')
hdilatin <- hdi %>% 
  filter(country %in% latin_america_paises)
idhginilatin <- left_join(dflatinok, hdilatin, by = c('country' = 'country'))


# validação

regras_la <- validator(gini10 > 50, X2019 >= 0.6)

# coloquei a exigência do índice gini10 ser maior que 50 e o valor # do IDH ser
# maior que 0.6 apenas para que houvesse casos em que a regra do validador não 
# seja obedecida.


validacao_latin_america <- confront(idhginilatin, regras_la)

summary(validacao_latin_america)

plot(validacao_latin_america)
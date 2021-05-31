library(data.table)
library(dplyr)
library(tidyverse)
library(poliscidata)

df <- world

latin_america_paises<-c("Argentina", "Brazil", "Bolivia", "Chile", "Colombia", "Costa Rica", "Cuba", "Dominican Republic", "Ecuador", "El Salvador", "Guatemala", "Haiti", "Honduras", "Mexico", "Nicaragua", "Panama", "Paraguay", "Peru", "Uruguay", "Venezuela")

dflatin <- df %>% filter(country %in% latin_america_paises)

mdflatin <- dflatin %>% group_by(country) %>% mutate(row = row_number()) %>% select(country, gini10, row)

pmdflatinw <- mdflatin %>% 
  pivot_wider(names_from = row, values_from = gini10) %>% 
  remove_rownames %>% 
  column_to_rownames(var="country") 
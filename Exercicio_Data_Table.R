library(data.table)
library(dplyr)
library(haven)

banco <- read_sav("https://github.com/MartinsRodrigo/Analise-de-dados/raw/master/04622.sav")
bancoDT <- banco %>% setDT()

bancoDT[ , lm(Q1607 ~ Q18)]

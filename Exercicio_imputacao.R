library(data.table)
library(funModeling) 
library(tidyverse)


#banco
options(scipen = 999)
url <- "https://github.com/MartinsRodrigo/Analise-de-dados/raw/master/04622.sav"
download.file(url, "banco.sav", mode = "wb")
library(haven)
banco <- read_sav("banco.sav") %>% 
  mutate_all(zap_label) %>%
  select(Q1607, Q18, Q1501, D1A_ID, D9, D2_SEXO, D12A) %>%
  mutate(D2_SEXO = as_factor(D2_SEXO),
         D12A = as_factor(D12A),
         Q18 = zap_labels(Q18),
         Q1501 = zap_labels(Q1501))
banco$Q1607 <- ifelse(banco$Q1607 > 10, NA, banco$Q1607)
banco$Q1501 <- ifelse(banco$Q1501 > 10, NA, banco$Q1501)
banco$Q18 <- ifelse(banco$Q18 > 10, NA, banco$Q18)
banco$D9 <- ifelse(banco$D9 > 9999997, NA, banco$D9)



################################################################################
################################################################################
################################################################################


#imputação numérica - tendência central
library(Hmisc)
banco$D9 <- impute(banco$D9, fun = mean) # média
table(is.imputed(banco$D9))


#Hot Deck - imputação aleatória
banco$Q1501 <- impute(banco$Q1501, "random")
table(is.imputed(banco$Q1501))



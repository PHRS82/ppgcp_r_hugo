library(dplyr)
library(lubridate)
library(tidyverse)
library(readxl)
library(fuzzyjoin)

confirmado <- c("CONFIRMADO")
obito <- c("OBITO")

# 1. Extraia a base geral de covid em Pernambuco
base <- read.csv2('https://dados.seplag.pe.gov.br/apps/basegeral.csv', sep = ';', encoding = 'UTF-8')

#2. Calcule, para cada município do Estado, o total de casos confirmados e o 
# total de óbitos por semana epidemiológica [atenção, você terá de criar uma 
# variável de semana epidemiológica com base na data].
base$dt_notificacao <- as.Date(base$dt_obito, format = "%Y-%m-%d")
base$epiweek <- epiweek(base$dt_notificacao)
baseconfirmados <- base %>% filter(classe %in% confirmado)
baseobitos <- base %>% filter(evolucao %in% obito)
baseconfirmados %>% group_by(municipio) %>% count(epiweek)
baseobitos %>% group_by(municipio) %>% count(epiweek)

#3. Enriqueça a base criada no passo 2 com a população de cada município, usando
# a tabela6579 do sidra ibge
populacao <- read_excel('bases_originais/tabela6579.xlsx')
populacao <- populacao %>% rename(municipio = `Tabela 6579 - População residente estimada`)
populacao <- populacao %>% rename(populacao = ...2)
populacao <- populacao %>%  mutate(municipio = str_remove_all(municipio, "(PE)")) %>% mutate(municipio = gsub("[:space:][()]", "", municipio)) %>% mutate(municipio = str_trim(municipio))
populacao <- populacao %>% select(municipio, populacao) %>% mutate(municipio = str_to_upper(municipio))
baseconfirmadosPop <- left_join(baseconfirmados, populacao, by = "municipio")
baseobitosPop <- left_join(baseobitos, populacao, by = "municipio")



#4. Calcule a incidência (casos por 100.000 habitantes) e letalidade (óbitos por
#100.000 habitantes) por município a cada semana epidemiológica.
baseconfirmados %>% group_by(municipio) %>% count(epiweek) %>% mutate(n = n/100000)
baseobitos %>% group_by(municipio) %>% count(epiweek) %>% mutate(n/100000)
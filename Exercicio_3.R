library(Hmisc)
library(dplyr)
library(zoo)

confneg <- c("CONFIRMADO", "NEGATIVO")

# 1. Extraia a base geral de covid em Pernambuco
base <- read.csv2('https://dados.seplag.pe.gov.br/apps/basegeral.csv', sep = ';', encoding = 'UTF-8')

#2. Corrija os NAs da coluna sintomas através de imputação randômica 
base$sintomas <- ifelse(base$sintomas == "", NA, base$sintomas)
base$sintomas <- impute(base$sintomas, "random")

#3. Calcule, para cada município do Estado, o total de casos confirmados e 
#negativos
basefiltrada <- base %>% filter(classe %in% confneg)
basefiltrada %>% count(municipio, classe)


#4. Crie uma variável binária se o sintoma inclui tosse ou não e calcule quantos 
# casos confirmados e negativos tiveram tosse como sintoma
basetagsint <- base %>% mutate(tag_sintoma = ifelse(grepl("TOSSE", sintomas), 'sim',
'nao'))
basetosse <- basetagsint %>% filter(tag_sintoma == "sim")
basetosseconfneg <- basetosse %>% filter(classe %in% confneg)
basetosseconfneg %>% count(classe)
  

#5. Agrupe os dados para o Estado, estime a média móvel de 7 dias de confirmados
#e negativos
base$dt_notificacao <- as.Date(base$dt_obito, format = "%Y-%m-%d")
baseMM7 <- base
baseMM7Conf <- baseMM7 %>% group_by(dt_notificacao) %>% mutate(confMM7 = round(rollmean(x = (classe == "CONFIRMADO"), 7, align = "right", fill = NA), 2)) # média movel de 7 dias de confirmados
baseMM7Neg <- baseMM7 %>% group_by(dt_notificacao) %>% mutate(negMM7 = round(rollmean(x = (classe == "NEGATIVO"), 7, align = "right", fill = NA), 2)) # média movel de 7 dias de confirmados

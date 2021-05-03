sinistrosRecife2019Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2019.csv', sep = ';', encoding = 'UTF-8')

# carrega a base de snistros de transito do site da PCR
sinistrosRecife2020Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2021Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2021-jan.csv', sep = ';', encoding = 'UTF-8')

# junta as bases de dados com comando rbind (juntas por linhas)

sinistrosRecifeRaw <- rbind(sinistrosRecife2020Raw, sinistrosRecife2021Raw)

# observa a estrutura dos dados
str(sinistrosRecifeRaw)

# modifca a data para formato date
sinistrosRecifeRaw$data <- as.Date(sinistrosRecifeRaw$data, format = "%Y-%m-%d")

# modifica natureza do sinistro de texto para fator
sinistrosRecifeRaw$natureza_acidente <- as.factor(sinistrosRecifeRaw$natureza_acidente)

# cria funçaõ para substituir not available (na) por 0
naZero <- function(x) {
  x <- ifelse(is.na(x), 0, x)
}

# aplica a função naZero a todas as colunas de contagem
sinistrosRecifeRaw[, 15:25] <- sapply(sinistrosRecifeRaw[, 15:25], naZero)




# ADIÇÃO DE MAIS UM ANO:
# No banco sinistrosRecife2019Raw há 3 colunas que não existem no banco geral.
# São as variáveis referência_cruzamento, numero_cruzamento, endereco_cruzamento
# para poder realizar o procedimento do rbind, conforme instruções, retiremos
# estas variáveis adicionais que não constam nos bancos mais recentes. Além disto
# o nome da primeira coluna no banco de 2019 está em letras maiúsculas, o que foi
# mudado.

sinistrosRecife2019Raw$referencia_cruzamento <- NULL
sinistrosRecife2019Raw$numero_cruzamento <- NULL
sinistrosRecife2019Raw$endereco_cruzamento <- NULL

colnames(sinistrosRecife2019Raw)[1]<-'data'

sinistrosRecifeRaw2 <- rbind(sinistrosRecife2019Raw, sinistrosRecifeRaw)

# Transformação de coluna em fator  
sinistrosRecifeRaw2$situacao <- as.factor(sinistrosRecifeRaw2$situacao)
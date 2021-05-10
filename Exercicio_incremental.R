library(dplyr)

# carrega base de dados original
SolicitacoesTempoReal <- read.csv2('http://dados.recife.pe.gov.br/dataset/99eea78a-1bd9-4b87-95b8-7e7bae8f64d4/resource/9afa68cf-7fd9-4735-b157-e23da873fef7/download/156_diario.csv', sep = ';', encoding = 'UTF-8')
SolicitacoesTempoReal <- SolicitacoesTempoReal[-362,]

# carrega base de dados para atualização
SolicitacoesTempoRealNew <- read.csv2('http://dados.recife.pe.gov.br/dataset/99eea78a-1bd9-4b87-95b8-7e7bae8f64d4/resource/9afa68cf-7fd9-4735-b157-e23da873fef7/download/156_diario.csv', sep = ';', encoding = 'UTF-8')

# criar a chave substituta
SolicitacoesTempoReal$chaveSubstituta = apply(SolicitacoesTempoReal[, c(5,6,9)], MARGIN = 1, FUN = function(i) paste(i, collapse = ""))
SolicitacoesTempoRealNew$chaveSubstituta = apply(SolicitacoesTempoRealNew[, c(5,6,9)], MARGIN = 1, FUN = function(i) paste(i, collapse = ""))

# cria base de comparação
SolicitacoesTempoRealIncremento <- (!SolicitacoesTempoRealNew$chaveSubstituta %in% SolicitacoesTempoReal$chaveSubstituta)

# retorna vetor com incremento
SolicitacoesTempoReal[SolicitacoesTempoRealIncremento,]

# junta base original e incremento
SolicitacoesTempoReal <- rbind(SolicitacoesTempoReal, SolicitacoesTempoReal[SolicitacoesTempoRealIncremento,])
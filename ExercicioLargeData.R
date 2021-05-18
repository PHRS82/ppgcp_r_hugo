library(ff)


enderecoBase <- 'bases_originais/largeData.csv'

system.time(extracaoLD4 <- read.csv.ffdf(file=enderecoBase))

sum(extracaoLD4[,6])
mean(extracaoLD4[,6])


#regressão linear
extracaoLD4Amostra <- extracaoLD4[sample(nrow(extracaoLD4), 100000) , ]

lm(e ~ ., extracaoLD4Amostra)

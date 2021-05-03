# indique uma vantagem e uma desvantagem de cada tipo de arquivo
# (nativo e plano com interoperabilidade).

O formato nativo (rds), é utilizaod pelo R e é mais eficiente, pois ocupa menos
espaço na máquina, entretanto, só roda em ferramentas compatíveis com o R.

o formato com plano interoperabilidade pode ser lido em outras linguagens, por
outras aplicações, como o formato csv ou txt.


# utilização da biblioteca microbenchmark para ver quanto tempo demora para 
# realizar as funções salvar e ler de cada arquivo para ver o tempo que leva
# para cada uma.

library(microbenchmark)

saveRDS(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.rds")
write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv")
write.table(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.txt")

sinistrosRecife <- readRDS('bases_tratadas/sinistrosRecife.rds')
sinistrosRecife <- read.csv2('bases_tratadas/sinistrosRecife.csv', sep = ';')
SinistrosRecife <- read.table('bases_tratadas/sinistrosRecife.txt')

# comparação dos processos usando a função microbenchmark
microbenchmark(a <- saveRDS(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.rds"), 
               b <- write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv"), 
               c <- write.table(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.txt"), 
               times = 10L)
microbenchmark(a <- readRDS('bases_tratadas/sinistrosRecife.rds'), 
               b <- read.csv2('bases_tratadas/sinistrosRecife.csv', sep = ';'), 
               c <- read.table('bases_tratadas/sinistrosRecife.txt'), 
               times = 10L)
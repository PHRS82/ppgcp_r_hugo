library(tidyverse)

# tarefa semente
tarefaSemente <- addTaskCallback(function(...) {set.seed(123);TRUE})
tarefaSemente 

# Normal
distNormal1 <- rnorm(500, sd = 1)
distNormal2 <- rnorm(500, sd = 2)

# Poisson
ContPois <- rpois(500, 3)

# Binomial Negativa
ContDisper <- rnbinom(500, mu = 3, size = 10)

# Binomial
Binominal <- rbinom(500, 1, 0.7) 

# Qualitativa
QualitatiaBinDummy <- ifelse(Binominal == 1, "sim", "não")

# Index
Index <- seq(1, length(Binominal))

# remoção da tarefa
removeTaskCallback(tarefaSemente)


# centralização das normais:
distNormal1Cent <- distNormal1 - mean(distNormal1)
distNormal2Cent <- distNormal2 - mean(distNormal2)


# trocar 0 por 1 nas variáveis de contagem
ContPois0_1 <- ContPois
ContPois0_1[ContPois0_1 == 0] <- 1
  
ContDisper0_1 <- ContDisper
ContDisper0_1[ContDisper0_1 == 0] <- 1


# criar novo data.frame com amostra (100 casos) do banco de dados original
dfOriginal <- data.frame(distNormal1, distNormal2, ContPois, ContDisper, Binominal,
                     QualitatiaBinDummy, Index)

dfNovo <- sample_n(dfOriginal, 100, FALSE)
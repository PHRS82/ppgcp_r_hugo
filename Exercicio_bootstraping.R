# bootstraping
set.seed(412)

bootsDistNormal10 <- replicate(10, sample(distNormalSimulacao, 10, replace = TRUE)) 
bootsDistNormal10

#operação - média - 100 amostras de 10 casos
mediaBootsNormal100 <-replicate(100, mean(sample(distNormalSimulacao, 10, replace = TRUE)))
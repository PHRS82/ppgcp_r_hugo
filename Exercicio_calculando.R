# Distribução simples (Poisson)
poissonSimulacao <- rpois(300, 3)
hist(poissonSimulacao)

# Centralização da Poisson
poissonSimulacaoCentral <- poissonSimulacao - mean(poissonSimulacao)
hist(poissonSimulacaoCentral)
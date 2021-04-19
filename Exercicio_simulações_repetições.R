# tarefa semente
tarefaSemente <- addTaskCallback(function(...) {set.seed(123);TRUE})
tarefaSemente 

# Normal
distNormalSimulacao <- rnorm(100)


# Binomial
distBinominalSimulacao <- rbinom(100, 1, 0.6) 

# Index
classeSimulacao <- c(rep("Jovem", length(distBinominalSimulacao)/2), rep("Jovem Adulto", length(distBinominalSimulacao)/2))

#remoção da tarefa
removeTaskCallback(tarefaSemente)

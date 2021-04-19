#criação de dataframe

install.packages("eeptools")

library(eeptools)

nomeAluno <- c("Pedro", "Arthur", "João", "Ana", "Maria", "Cecília")

nascimentoAluno <- as.Date(c("1982-12-30", "1983-12-29", "1985-10-06", 
                           "1977-07-27", "1981-02-06", "1987-07-07"))

idadeAluno <- round( age_calc( nascimentoAluno, units = 'years'))

listaAlunos <- data.frame(
  nome = nomeAluno,
  dataNascimento = nascimentoAluno,
  idade = idadeAluno
)
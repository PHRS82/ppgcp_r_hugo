# Criação de função (aumentar o número das observações da variável em 1)

aumento <- function(X) {
  X <- X + 1
return(X)}

aumento(df$obama_therm)

aumentoTeste <- aumento(df$obama_therm)

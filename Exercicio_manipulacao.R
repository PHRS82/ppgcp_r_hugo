#criação de uma nova variável dentro do banco df em que se verifica se o respondente é branco ou não

library(poliscidata)
df <- nes
df$WhiteDummy <- ifelse(df$dem_raceeth == 'White non-Hispanic', "yes", "no")

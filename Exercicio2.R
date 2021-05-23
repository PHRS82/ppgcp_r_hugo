library(ff)
library(ffbase)

#criando objetos com os endereços dos arquivos csv
sf12 <- 'bases_originais/situacaofinalalunos2012.csv'
sf13 <- 'bases_originais/situacaofinalalunos2013.csv'
sf14 <- 'bases_originais/situacaofinalalunos2014.csv'
sf15 <- 'bases_originais/situacaofinalalunos2015.csv'
sf16 <- 'bases_originais/situacaofinalalunos2016.csv'
sf17 <- 'bases_originais/situacaofinalalunos2017.csv'
sf18 <- 'bases_originais/situacaofinalalunos2018.csv'
sf19 <- 'bases_originais/situacaofinalalunos2019.csv'
sf20 <- 'bases_originais/situacaofinalalunos2020.csv'


# criando os arquivos ffs
ext12 <- read.csv.ffdf(file=sf12)
ext13 <- read.csv.ffdf(file=sf13)
ext14 <- read.csv.ffdf(file=sf14)
ext15 <- read.csv.ffdf(file=sf15)
ext16 <- read.csv.ffdf(file=sf16)
ext17 <- read.csv.ffdf(file=sf17)
ext18 <- read.csv.ffdf(file=sf18)
ext19 <- read.csv.ffdf(file=sf19)
ext20 <- read.csv.ffdf(file=sf20)

# juntando os data frames
sfmerge <- ffdfrbind.fill(ext12, ext13, ext14, ext15, ext16, ext17, ext18, ext19, ext20) # junta bases semelhantes forçando preenchimento

#limpeza da staging area
rm(list=(ls()[ls()!="sfmerge"]))

#exportação de base pronta em formato nativo do R
saveRDS(sfmerge, "bases_tratadas/SituaçãoFinalAlunos12-20.rds")
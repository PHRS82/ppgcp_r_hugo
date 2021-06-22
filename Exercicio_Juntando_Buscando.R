library(fuzzyjoin)
library(dplyr)
library(tidyr)

baseA <- read.csv2('bases_originais/Serie.csv')
baseB <- read.csv2('bases_originais/Estado.csv') 
baseC <- fuzzyjoin::stringdist_join(baseA, baseB, mode='left')



times_sp <- c("Palmeiras", "São Paulo", "Santos", "Corinthians", "Bragantino")

baseD <- baseC %>% mutate(tag_SP = ifelse(grepl(paste(times_sp, collapse="|"), Estado), 'SP', 'Outros'))
#banco
library(haven)
library(tidyverse)

url <- "https://github.com/MartinsRodrigo/Analise-de-dados/raw/master/04622.sav"
download.file(url, "banco.sav", mode = "wb")
banco <- read_sav("banco.sav") %>% mutate_all(zap_label)
banco_selecionado <- banco %>% 
  select(Q1607, Q18, Q1501, D1A_ID, D9, D2_SEXO, D12A)
bancofiltrado <- banco_selecionado %>% 
  filter(Q18<=10, 
         Q1607<=10, 
         Q1501<=10, 
         D9<9999998,
         D12A != 8 & D12A !=9
  )

# Explicações sobre o banco: usei neste exercício um banco que estamos usando na
# disciplina de Rodrigo. Sobre as variáveis: 
# Q1607 (que indica uma nota de 0 a # 10 ao candidato Jair Bolsonaro) 
# Q18 (que indica uma auto-atribuição em uma escala ideologica de 0 a 10, da 
# esquerda para a direita), 
# Q1501 (nota atribuída ao PT), 
# D1A_ID (idade do respondente) 
# D9 (renda do respondente). 
# D2_SEXO (sexo do respondente) 
# D12A (cor/raça)



#exercício:
library(dplyr)


count(bancofiltrado, D2_SEXO) 

bancofiltrado %>% group_by(D2_SEXO) %>% summarise(avg = mean(Q1607))

bancofiltrado %>%  filter(D2_SEXO != 2) %>% summarise(avg = mean(Q1607))

bancofiltrado %>% rename(Idade = D1A_ID)
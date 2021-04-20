# função de repetição - para não ficar exatamente igual ao exercício, vou utilizar um novo banco

library(tidyverse)
library(poliscidata)

df <- nes
df_selecionado <- df %>%
  select(ftgr_cons, obama_therm, abort_scale, prochoice_scale)

apply(df_selecionado, 2, mean, na.rm=TRUE)

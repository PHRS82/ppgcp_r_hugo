#### Staging area e uso de memória

ls()

# Quanto cada objeto está ocupando

for (itm in ls()) { 
  print(formatC(c(itm, object.size(get(itm))), 
                format="d", 
                width=30), 
        quote=F)
}

# itens que mais estavam ocupando a memória, em ordem decrescente: 
# sinistrosRecifeRaw2, sinistrosRecife2019Raw, #SinistrosRecifeRaw, 
# sinistrosRecife2020Raw e sinistrosRecife2021Raw


#limpeza da staging area:

rm(list = c('sinistrosRecifeRaw2', 'sinistrosRecife2019Raw', 
            'sinistrosRecife2020Raw', 'sinistrosRecife2021Raw', 'itm'))


saveRDS(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.rds")

write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv")
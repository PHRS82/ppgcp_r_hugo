library(data.table)
enderecoBase <- 'bases_originais/largeData.csv'
amostraLD1 <- read.csv2(enderecoBase, nrows=20, sep=",", dec = ".")  
amostraLD1Classes <- sapply(amostraLD1, class)
system.time(extracaoLD2 <- data.frame(read.csv2("bases_originais/largeData.csv", sep=",", dec = ".", colClasses=amostraLD1Classes) ) )  

system.time(extracaoLD3 <- fread(enderecoBase))
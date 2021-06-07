library(ade4)
library(arules)
library(forcats)

facebook <- read.table("bases_originais/dataset_Facebook.csv", sep=";", header = T)
str(facebook)

for(i in 2:7) {
  facebook[,i] <- as.factor(facebook[,i]) } 

inteirosFacebook <- unlist(lapply(facebook, is.integer))  
facebookInteiros <- facebook[, inteirosFacebook]

facebookInteiros$comment.Disc <- discretize(facebookInteiros$comment, method = "interval", breaks = 5, labels = c("pouquíssimos", 'poucos', 'razoável', 'muitos', 'muitíssimo'))

fct_lump(facebookInteiros$comment.Disc, n = 2)
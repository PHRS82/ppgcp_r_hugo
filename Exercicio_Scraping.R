library(rvest)
library(dplyr)

# tabelas da wikipedia
url <- "https://en.wikipedia.org/wiki/Pink_Floyd_discography"

urlTables <- url %>% read_html %>% html_nodes("table")

urlLinks <- url %>% read_html %>% html_nodes("link")

DiscografiaPF <- as.data.frame(html_table(urlTables[2]))
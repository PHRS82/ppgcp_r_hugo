# 1 - CSV
Acidentes2020 <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv', sep = ';', encoding = 'UTF-8')


# 2 - JSON
install.packages('rjson')
library(rjson)
MetadadosAcidentesJSON <- fromJSON(file= "http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/1eed10b9-fe8a-4e5a-86cf-ad0353f05682/download/acidentes-de-transito.json" )
MetadadosAcidentesJSON <- as.data.frame(MetadadosAcidentesJSON)


# 3 - XML
install.packages('XML')
library(XML)
WSUCourses <- xmlToDataFrame("http://aiweb.cs.washington.edu/research/projects/xmltk/xmldata/data/courses/wsu.xml")
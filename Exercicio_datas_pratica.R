###
url = 'https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-states.csv'
covidBR = read.csv2(url, encoding='latin1', sep = ',') 

covidPE <- subset(covidBR, state == 'PE') 

str(covidPE) 

covidPE$date <- as.Date(covidPE$date, format = "%Y-%m-%d") 

str(covidPE) 

covidPE$dia <- seq(1:length(covidPE$date)) 

predDia = data.frame(dia = covidPE$dia) 
predSeq = data.frame(dia = seq(max(covidPE$dia)+1, max(covidPE$dia)+180)) 

predDia <- rbind(predDia, predSeq)

library(drc) # pacote para predição

fitLL <- drm(deaths ~ dia, fct = LL2.5(),
             data = covidPE, robust = 'mean') 

plot(fitLL, log="", main = "Log logistic")

predLL <- data.frame(predicao = ceiling(predict(fitLL, predDia)))
predLL$data <- seq.Date(as.Date('2020-03-12'), by = 'day', length.out = length(predDia$dia))

predLL <- merge(predLL, covidPE, by.x ='data', by.y = 'date', all.x = T) 

library(plotly)

plot_ly(predLL) %>% add_trace(x = ~data, y = ~predicao, type = 'scatter', mode = 'lines', name = "Mortes - Predição") %>% add_trace(x = ~data, y = ~totalCases, name = "Mortes - Observados", mode = 'lines') %>% layout(
  title = 'Predição de Mortes de COVID 19 em Pernambuco', 
  xaxis = list(title = 'Data', showgrid = FALSE), 
  yaxis = list(title = 'Mortes Acumuladas por Dia', showgrid = FALSE),
  hovermode = "compare")

library(zoo)

covidPE <- covidPE %>% mutate(newDeathsMM7 = round(rollmean(x = newDeaths, 7, align = "right", fill = NA), 2))

covidPE <- covidPE %>% mutate(newDeathsL7 = dplyr::lag(newDeaths, 7))

plot_ly(covidPE) %>% add_trace(x = ~date, y = ~newDeaths, type = 'scatter', mode = 'lines', name = "Novas Mortes") %>% add_trace(x = ~date, y = ~newDeathsMM7, name = "Novas Mortes MM7", mode = 'lines') %>% layout(
  title = 'Novas Mortes por COVID19 em Pernambuco', 
  xaxis = list(title = 'Data', showgrid = FALSE), 
  yaxis = list(title = 'Novas Mortes por Dia', showgrid = FALSE),
  hovermode = "compare") 

library(xts)

(covidPETS <- xts(covidPE$newDeaths, covidPE$date))
str(covidPETS)

autoplot(covidPETS)
acf(covidPETS)
library(lubridate)

(str(minhaData1 <- as.Date(c("2021-06-26 17:15", "2021-06-27 17:00")) ) )

(str(minhaData2 <- as.POSIXct(c("2021-06-26 17:15", "2021-06-27 17:00")) ) )
unclass(minhaData2)

(str(minhaData3 <- as.POSIXlt(c("2021-06-26 17:15", "2021-06-27 17:00")) ) )
unclass(minhaData3)

year(minhaData3)
wday(minhaData3, label = T, abbr = T)

(meuIntervalo <- as.interval(minhaData3[2], minhaData3[1]) )
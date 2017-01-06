library(data.table)
library(rjson)
library(dplyr)



queryUrl = 'http://ptx.transportdata.tw/MOTC/v2/Bus/StopOfRoute/InterCity?$format=JSON'
queryUrl <- URLencode(queryUrl)
read <- readLines(queryUrl, warn=F)
dat <- fromJSON(read)

# test
# queryUrl = 'http://ptx.transportdata.tw/MOTC/v2/Bus/StopOfRoute/InterCity?$top=30&$format=JSON'
# queryUrl <- URLencode(queryUrl)
# read <- readLines(queryUrl, warn=F)
# dat <- fromJSON(read)

dat.df <- NULL
for (i in 1:length(dat)) {
  route <- dat[[i]]
  route.df <- unlist(r)[1:4]
  stops.df <- NULL
  for (j in 1:length(route$Stops)) {
    stops.df <- rbind(stops.df, c(route.df, unlist(route$Stops[[j]])))
  }
  dat.df <- rbind(dat.df, stops.df)
}
# dat.df <- dat.df[,-which(colnames(dat.df) %in% c('StopBoarding', 'StopSequence'))]
# 9586
# dat.df <- dat.df[,5:ncol(dat.df)]
write.csv(dat.df, 'bus_data.csv', row.names=F)

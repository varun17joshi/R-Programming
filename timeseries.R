library(forecast)
a<-read.csv('kk.csv',h=T)
a<-a[order(a$YEAR,a$WEEK),]
timeseries<-ts(a$POS_QTY,start = c(a$YEAR[1],a$WEEK[1]),frequency = 52)
plot(timeseries)
decompose(timeseries)
forecast(timeseries,10)
f<-auto.arima(timeseries)
forecast(f,10)

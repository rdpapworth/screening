library(gtrendsR)

#c("prostate cancer", "bowel cancer",  "cervical cancer")

t <- gtrends(c("prostate cancer",  "cervical cancer"), geo=c("GB"), time="2012-01-01 2016-12-31")

plot(t)

#identify seasonality

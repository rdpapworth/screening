library(gtrendsR)
library(ggplot2)

#c("prostate cancer", "bowel cancer",  "cervical cancer")

t <- gtrends(c("breast cancer",  "cervical cancer", "bowel cancer"), geo=c("GB"), time="2012-01-01 2016-12-31")

t <- gtrends(c( "breast cancer"), geo=c("GB"), time="2012-01-01 2016-12-31")

plot(t)

# drop 16/03/2014 - weird peak in all searches
t$interest_over_time <- t$interest_over_time[t$interest_over_time$hits != 100,]

t$interest_over_time <- t$interest_over_time[!(t$interest_over_time$date >  as.Date('2014-03-15') & t$interest_over_time$date <  as.Date('2014-03-17')) ,]

plot(t)

t$interest_over_time$mnth = factor(months(t$interest_over_time$date, abbreviate = T), levels=c("Jan", "Feb", "Mar","Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))

t$interest_over_time %>%
  group_by(keyword) %>%
  summarise(min=min(hits), max=max(hits), mean=mean(hits), median=median(hits))



ggplot(t$interest_over_time, aes(x=mnth, y=hits)) + 
  geom_boxplot() +
  geom_jitter(shape=16, position=position_jitter(0.2)) +
  labs(title="Searches by Month of Year",x="Month of Year", y = "hits") +
  facet_grid(t$interest_over_time$keyword ~ .)

x <- gtrends(c("breast cancer treatment",  "cervical cancer treatment", "bowel cancer treatment"), geo=c("GB"), time="2012-01-01 2016-12-31")

plot(x)

x$interest_over_time <- x$interest_over_time[!(x$interest_over_time$date >  as.Date('2014-03-15') & x$interest_over_time$date <  as.Date('2014-03-17')) ,]

plot(x)

View(x$interest_over_time)



x$interest_over_time %>%
  group_by(keyword) %>%
  summarise(min=min(hits), max=max(hits), mean=mean(hits))


#identify seasonality

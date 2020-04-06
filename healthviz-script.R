#data vis of my health information before and after coronavirus pandemic?
setwd("/Users/rachelkwon/GitHub/healthviz")
#load libraries
library(ggplot2)
library(dplyr)
library(tidyverse)
library(scales)
library(lubridate)

#load data
#sleep data
sleep <- read.csv("sleep_data.csv")  
health <- read.csv("health_data.csv")

#first we will tackle health data 
#formatting 
health$date <- as.Date(dmy_hm(health$Start))
health$date <- format(as.Date(health$date, format = "%d/%m/%Y"), "%m-%d-%Y")

health <- health %>% rename(distance = Distance..mi.) 
health <- health %>% rename(steps=Steps..count.)


#subset dates
mydates <- interval(start = `01-01-2020`, end = `03-03-2020`)
NewDate <- Dates[which(date %within% mydates),]
#ok first visualization
coronadates<-health%>%
 filter(as.numeric(date) >= as.Date("03-01-2020"))
test <- health %>%
  arrange(date) %>% 
  filter(date >= as.Date("01-01-2020"))  %>%
  ggplot(aes(x= date, y = distance)) +
  geom_point(alpha = 0.3) +
  geom_smooth(span = 0.2, col = "grey30", se = FALSE) +
  labs(title = "Apple Health Steps",
       caption = "rachel")

#data vis of my health information before and after coronavirus pandemic?
setwd("/Users/rachelkwon/GitHub/healthviz")
#load libraries
library(ggplot2)
library(dplyr)
library(tidyverse)
library(scales)

#load data
#sleep data
sleep <- read.csv("sleep_data.csv")  
health <- read.csv("health_data.csv")



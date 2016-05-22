# explanatory analysis
#week 1 - project

w1p <- read.csv("./course-explanatory-analysis/household_power_consumption.txt", header = T, stringsAsFactors =  F, sep = ";")
line_index <- grep("1/2/2007|2/2/2007", w1p$Date)
data_sub <- w1p[line_index,]


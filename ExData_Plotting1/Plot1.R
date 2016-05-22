# explanatory analysis
#week 1 - project

w1p <- read.csv("./course-explanatory-analysis/household_power_consumption.txt", header = T, stringsAsFactors =  F, sep = ";")

#select records only between 2007-02-01 and 2007-02-02
line_index <- grep("^1/2/2007$|^2/2/2007$", w1p$Date)
data_sub <- w1p[line_index,]

#transform string to numeric
data_sub <- transform(data_sub, Global_active_power = as.numeric(Global_active_power))

#generate chart
hist(data_sub$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, "./course-explanatory-analysis/ExData_Plotting1/plot1.png")
dev.off()
# explanatory analysis
#week 1 - project

w1p <- read.csv("./course-explanatory-analysis/household_power_consumption.txt", header = T, stringsAsFactors =  F, sep = ";")

#select records only between 2007-02-01 and 2007-02-02
line_index <- grep("^1/2/2007$|^2/2/2007$", w1p$Date)
data_sub <- w1p[line_index,]

#transform string to numeric
data_sub <- transform(data_sub, Global_active_power = as.numeric(Global_active_power), Sub_metering_1 = as.numeric(Sub_metering_1 ), Sub_metering_2 = as.numeric(Sub_metering_2))
datetime <- strptime(paste(data_sub$Date, data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#generate chart
plot(datetime, data_sub$Sub_metering_1, type = 'l', xlab = "", ylab = "Energy Sub Metering")
lines(datetime, data_sub$Sub_metering_2, col = "red")
lines(datetime, data_sub$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2)

dev.copy(png, "./course-explanatory-analysis/ExData_Plotting1/plot3.png", width = 480, height = 480)
dev.off()
# explanatory analysis
#week 1 - project

w1p <- read.csv("./course-explanatory-analysis/household_power_consumption.txt", header = T, stringsAsFactors =  F, sep = ";")

#select records only between 2007-02-01 and 2007-02-02
line_index <- grep("^1/2/2007$|^2/2/2007$", w1p$Date)
data_sub <- w1p[line_index,]

#transform string to numeric
data_sub <- transform(data_sub, Global_active_power = as.numeric(Global_active_power), Sub_metering_1 = as.numeric(Sub_metering_1 ), Sub_metering_2 = as.numeric(Sub_metering_2), Global_reactive_power = as.numeric(Global_reactive_power), Voltage = as.numeric(Voltage))

#generate chart
#plot1
hist(data_sub$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#plot2
plot(datetime, data_sub$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")
#plot3
plot(datetime, data_sub$Sub_metering_1, type = 'l', xlab = "", ylab = "Energy Sub Metering")
lines(datetime, data_sub$Sub_metering_2, col = "red")
lines(datetime, data_sub$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2)


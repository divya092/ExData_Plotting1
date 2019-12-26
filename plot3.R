#Load required package
library(data.table)

#Read the data file
data <- data.table::fread("household_power_consumption.txt", na.strings="?")
data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

#Convert Date column to POSIXct Date type
data[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#Filter the dataset based on date range
data <- data[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#Plot 3
png("plot3.png", width=480, height=480)
plot(data[, dateTime], data[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(data[, dateTime], data[, Sub_metering_2],col="red")
lines(data[, dateTime], data[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.off()
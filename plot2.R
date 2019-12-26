#Load required package
library(data.table)

#Read the data file
data <- data.table::fread("household_power_consumption.txt", na.strings="?")
data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

#Convert Date column to POSIXct Date type
data[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#Filter the dataset based on date range
data <- data[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#Plot 2
png("plot2.png", width=480, height=480)
plot(x = data[, dateTime], y = data[, Global_active_power], type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
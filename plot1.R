#Load required package
library(data.table)

#Read the data file
data <- data.table::fread("household_power_consumption.txt", na.strings="?")
data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

#Convert Date column to Date type
data[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

#Filter the dataset based on date range
data <- data[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

#Plot 1
png("plot1.png", width=480, height=480)
hist(data[, Global_active_power], main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
## 
## Johns Hopkins University / Coursera
## Exploratory Data Analysis
## Course Project 1
## February 2015
##
## This script imports household power consumption data, extracts a two day slice, and recreates the
## graph as requested by the assignment, and saves in a PNG file.  The script should be run in the
## same directory as the data file.
## 

## 
## 1. Read in the data and combine the date and time into a single variable
## 

data <- read.table ("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
data$Time <- strptime(paste (data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- strptime(data$Date, "%d/%m/%Y")

## 
## 2. Subset the data to the desired interval (Feb 1-2, 2007)
## 

filtereddata <- data[(data$Date >= "2007-02-01" & data$Date <= "2007-02-02"),]

## 
## 3. Create each of the graphs in the PNG device/file, and arrange as a 2x2 grid
## 

png (file = "plot4.png", width = 480, height = 480)

## Create the grid
par (mfrow = c(2, 2))

## Create the individual graphs

## Top left
plot (filtereddata$Time, filtereddata$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines (filtereddata$Time, filtereddata$Global_active_power)

## Top right
plot (filtereddata$Time, filtereddata$Voltage, type = "n", xlab = "date/time", ylab = "Voltage")
lines (filtereddata$Time, filtereddata$Voltage)

## Bottom left
plot (range (filtereddata$Time), range (filtereddata$Sub_metering_1, filtereddata$Sub_metering_2, filtereddata$Sub_metering_3), type = "n", xlab = "", ylab = "Energy sub metering")
lines (filtereddata$Time, filtereddata$Sub_metering_1, col = "black")
lines (filtereddata$Time, filtereddata$Sub_metering_2, col = "red")
lines (filtereddata$Time, filtereddata$Sub_metering_3, col = "blue")
legend ("topright", bty = "n", lty = 1, lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Bottom right
plot (filtereddata$Time, filtereddata$Global_reactive_power, type = "n", xlab = "date/time", ylab = "Global_reactive_power")
lines (filtereddata$Time, filtereddata$Global_reactive_power)

dev.off()

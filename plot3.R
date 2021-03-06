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
## 3. Create the graph in the PNG device/file, including a legend
## 

png (file = "plot3.png", width = 480, height = 480)

plot (range (filtereddata$Time), range (filtereddata$Sub_metering_1, filtereddata$Sub_metering_2, filtereddata$Sub_metering_3), type = "n", xlab = "", ylab = "Energy sub metering")
lines (filtereddata$Time, filtereddata$Sub_metering_1, col = "black")
lines (filtereddata$Time, filtereddata$Sub_metering_2, col = "red")
lines (filtereddata$Time, filtereddata$Sub_metering_3, col = "blue")

legend ("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

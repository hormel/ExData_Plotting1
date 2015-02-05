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
## 3. Create the graph in the PNG device/file
## 

png (file = "plot2.png", width = 480, height = 480)

plot (filtereddata$Time, filtereddata$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines (filtereddata$Time, filtereddata$Global_active_power)

dev.off()

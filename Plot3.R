# Data Sciennce Course 4
# Week 1 Project
# August 2018
# Plot 3
#
setwd("C:/Training/Data Science/Course 4 Exploratory Data Analysis/Week 1/Project")

Fulldata <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

#FullTimeDate <- strptime(paste(Fulldata$Date, Fulldata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

dim(Fulldata)
# [1] 2075259       9

Subdata <- subset(Fulldata, Date == "1/2/2007" | Date =="2/2/2007")

dim(Subdata)
# [1] 2880    9

str(Subdata)
#'data.frame':	2880 obs. of  9 variables:
#  $ Date                 : chr  "1/2/2007" "1/2/2007" "1/2/2007" "1/2/2007" ...
#$ Time                 : chr  "00:00:00" "00:01:00" "00:02:00" "00:03:00" ...
#$ Global_active_power  : chr  "0.326" "0.326" "0.324" "0.324" ...
#$ Global_reactive_power: chr  "0.128" "0.130" "0.132" "0.134" ...
#$ Voltage              : chr  "243.150" "243.320" "243.510" "243.900" ...
#$ Global_intensity     : chr  "1.400" "1.400" "1.400" "1.400" ...
#$ Sub_metering_1       : chr  "0.000" "0.000" "0.000" "0.000" ...
#$ Sub_metering_2       : chr  "0.000" "0.000" "0.000" "0.000" ...
#$ Sub_metering_3       : num  0 0 0 0 0 0 0 0 0 0 ...

# change the data classes to proper classes

Subdata$Date <- as.Date(Subdata$Date, format="%d/%m/%Y")
Subdata$Time <- format(Subdata$Time, format="%H:%M:%S")
Subdata$Sub_metering_1 <- as.numeric(Subdata$Sub_metering_1)
Subdata$Sub_metering_2 <- as.numeric(Subdata$Sub_metering_2)
Subdata$Sub_metering_3 <- as.numeric(Subdata$Sub_metering_3)

#png("plot1.png", width=480, height=480)
#hist(Subdata$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)")
#dev.off()

# read in date/time info in format 'm/d/y h:m:s'

# create  x axis DataTime
DateTime <- strptime(paste(Subdata$Date, Subdata$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
# setup png device
png("plot3.png", width=480, height=480)
with(Subdata, plot(DateTime, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"), type="n")
lines(DateTime, Subdata$Sub_metering_1,type="l", col= "black")
lines(DateTime, Subdata$Sub_metering_2,type="l", col= "red")
lines(DateTime, Subdata$Sub_metering_3,type="l", col= "blue")
# legend(x, y=NULL, legend, fill, col, bg)
legend(c("topright"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty= 1, lwd=2, col=c("black","red","blue"))
dev.off()

# Name: plot 2 
# Author: Rui La <larui529@gmail.com>
#
# Note: this code can be run on Mac OSX
#

## download zip file from internet
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileName <- "powerData.zip"
#check if the file is exist
if (!file.exists(fileName)) {
  message ("downloading file")
  download.file(fileURL, destfile = "powerData.zip", method = "curl")
}

fileName2 <- "household_power_consumption.txt"
## unzip the file
if (!file.exists(fileName2)) {
  message ("unzip the file")
  unzip(zipfile = "powerData.zip")
  
}

## extract data and read it
system ("(head -1 household_power_consumption.txt; 
        grep '^[1|2]/2/2007' household_power_consumption.txt;)>mydata.csv")

## read csv file
Edata <- read.csv ("mydata.csv", sep = ';', header = T, na.strings = '?')
## convert character of time to time 
Edata$datetime <- strptime(paste(Edata$Date,Edata$Time), "%d/%m/%Y %H:%M")
## output as PNG file
png ("plot2.png", width = 480, height = 480)


## plot the plot 2
plot(
       Edata$datetime,
       Edata$Global_active_power,
       xlab ="",
       ylab = "Global Active Power",
       "l"
   )

## close PNG device

dev.off ()

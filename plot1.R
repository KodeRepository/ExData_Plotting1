#set working directory - optional
setwd("D:\\DataScience\\Exploratory Data Analysis\\Course Project 1")

#Download the file to working Directory and Unzip it
if (!file.exists("power_consumption.zip")) {
  download.file(url="http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile="power_consumption.zip",)
  unzip("power_consumption.zip")  
}
  

## Read complete data to the frame powerdata_full
powerdata_full <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')

#Adjust Date and Time Values
powerdata_full$Date <- as.Date(powerdata_full$Date, format = "%d/%m/%Y")
powerdata_full$Time <- strptime(powerdata_full$Time, format="%H:%M:%S")

## Read the required data as subset onto another frame req_data and remove the superset dataframe
req_data <- subset(powerdata_full, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(powerdata_full)

#PNG Device, Plot histogram
png(filename="plot1.png", width=480, height=480)
hist(req_data$Global_active_power, col="#ff2500", xlab="Global Active Power (kilowatts)",  main="Global Active Power")
dev.off()


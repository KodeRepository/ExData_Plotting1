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
## Read the required data as subset onto another frame req_data and remove the superset dataframe
req_data <- subset(powerdata_full, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(powerdata_full)



#Set the DateTime format

datetime <- paste(as.Date(req_data$Date), req_data$Time)
req_data$Datetime <- as.POSIXct(datetime)

#PNG Device, Plot
png(filename="plot2.png", width=480, height=480)
plot(req_data$Global_active_power ~ req_data$Datetime, type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()




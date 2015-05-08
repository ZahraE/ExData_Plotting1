download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./EPC.zip")
unzip("EPC.zip")
library(data.table)
data=fread("household_power_consumption.txt",sep=";")
data=as.data.frame(data)
A=data[data$Date %in% c("1/2/2007","2/2/2007"),]
datetime <- strptime(paste(A$Date, A$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
B=as.numeric(A$Global_active_power)
plot(datetime,B,type="scatter",xlab="",ylab="Global Active Power(kilowatts)")
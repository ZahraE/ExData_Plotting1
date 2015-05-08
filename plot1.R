download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./EPC.zip")
unzip("EPC.zip")

library(data.table)
data=fread("household_power_consumption.txt",sep=";")
data=as.data.frame(data)
A=data[data$Date %in% c("1/2/2007","2/2/2007"),]

png("plot1.png", width = 480, height = 480)
hist(as.numeric(A$Global_active_power),col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")
dev.off()
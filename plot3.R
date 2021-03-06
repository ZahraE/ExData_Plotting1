download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./EPC.zip")
unzip("EPC.zip")

library(data.table)
data=fread("household_power_consumption.txt",sep=";")
data=as.data.frame(data)
A=data[data$Date %in% c("1/2/2007","2/2/2007"),]
datetime <- strptime(paste(A$Date, A$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
B=as.numeric(A$Sub_metering_1)
C=as.numeric(A$Sub_metering_2)
D=as.numeric(A$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
par(mar=4,4,3,3)
plot(datetime,B,type="scatter",xlab="",ylab="Energy sub metering")
lines(datetime,C,col="red")
lines(datetime,D,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
#Read and subset Data

data<-read.delim("household_power_consumption.txt",header = TRUE,sep = ";",colClasses=c("character", "character", rep("numeric",7)),na="?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(data, Date %in% dates)

#Plot3
data$Time <- as.POSIXct(paste(data$Date, data$Time))
plot(data$Time, data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2,col="red")
lines(data$Time, data$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=2,lty=1)
dev.copy(png,file="plot3.png")
dev.off()

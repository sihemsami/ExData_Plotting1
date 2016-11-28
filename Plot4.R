#Read and subset Data

data<-read.delim("household_power_consumption.txt",header = TRUE,sep = ";",colClasses=c("character", "character", rep("numeric",7)),na="?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(data, Date %in% dates)

#Plot4
data$Time <- as.POSIXct(paste(data$Date, data$Time))
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
plot(data$Time, data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(data$Time, data$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(data$Time, data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2,col="red")
lines(data$Time, data$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=2,lty=1)
plot(data$Time, data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.copy(png,file="plot4.png")
dev.off()

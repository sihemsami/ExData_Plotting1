#Read and subset Data

data<-read.delim("household_power_consumption.txt",header = TRUE,sep = ";",colClasses=c("character", "character", rep("numeric",7)),na="?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(data, Date %in% dates)

#Plot2
data$Time <- as.POSIXct(paste(data$Date, data$Time))
plot(data$Time, data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()

#Read and subset Data

data<-read.delim("household_power_consumption.txt",header = TRUE,sep = ";",colClasses=c("character", "character", rep("numeric",7)),na="?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(data, Date %in% dates)

#Plot1

hist(data$Global_active_power,xlab = "Global Active Power (Kilowatts)",main="Global Active Power",col="red")
dev.copy(png,file="plot1.png")
dev.off()

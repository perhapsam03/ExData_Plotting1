data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataFiltered <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

timeFormatted <- strptime(paste(dataFiltered$Date, dataFiltered$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
activeData <- as.numeric(dataFiltered$Global_active_power)
reactiveData <- as.numeric(dataFiltered$Global_reactive_power)
voltage <- as.numeric(dataFiltered$Voltage)
subMetering1 <- as.numeric(dataFiltered$Sub_metering_1)
subMetering2 <- as.numeric(dataFiltered$Sub_metering_2)
subMetering3 <- as.numeric(dataFiltered$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(timeFormatted, activeData, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(timeFormatted, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(timeFormatted, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(timeFormatted, subMetering2, type="l", col="red")
lines(timeFormatted, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(timeFormatted, reactiveData, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

dataFiltered <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

timeFormatted <- strptime(paste(dataFiltered$Date, dataFiltered$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

ydata <- as.numeric(subSetData$Global_active_power)

png("plot2.png", width=480, height=480)

plot(timeFormatted, ydata, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
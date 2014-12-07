filePath <- '../../household_power_consumption.txt'
data <- read.table(filePath,  header=TRUE, sep=";",  na.strings="?" )

data <- subset(data, 
              as.Date(Date, format="%d/%m/%Y") >= as.Date('2007-02-01')
              & as.Date(Date, format = "%d/%m/%Y") <= as.Date('2007-02-02'))

data$datetime <- strptime(paste(data$Date, data$Time), "%e/%m/%Y %H:%M:%S")

png(filename="plot4.png", 
    width=480, height=480, 
    units="px",  bg = "transparent");
par(mfrow = c(2, 2))

plot(data$datetime, data$Global_active_power, type='l',
     ylab = "Global Active Power",
     xlab = "",
     main = "")

plot(data$datetime, data$Voltage, type='l',
     ylab = "Voltage",
     xlab = "datetime",
     main = "")

plot(data$datetime, data$Sub_metering_1, type='l',
     col = "black", 
     ylab = "Energy sub metering",
     xlab = "",
     main = "")
points(data$datetime, data$Sub_metering_2, type='l', col="red")
points(data$datetime, data$Sub_metering_3, type='l', col="blue")
legend("topright", bty = "n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=1) 

plot(data$datetime, data$Global_reactive_power, type='l',
     ylab = "Global_reactive_power",
     xlab = "datetime",
     main = "")

dev.off()
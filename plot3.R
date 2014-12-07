filePath <- '../../household_power_consumption.txt'
data <- read.table(filePath,  header=TRUE, sep=";",  na.strings="?" )

data <- subset(data, 
              as.Date(Date, format="%d/%m/%Y") >= as.Date('2007-02-01')
              & as.Date(Date, format = "%d/%m/%Y") <= as.Date('2007-02-02'))

data$datetime <- strptime(paste(data$Date, data$Time), "%e/%m/%Y %H:%M:%S")

png(filename="plot3.png", 
    width=480, height=480, 
    units="px",  bg = "transparent");
plot(data$datetime, data$Sub_metering_1, type='l',
     col = "black", 
     ylab = "Energy sub metering",
     xlab = "",
     main = "")
points(data$datetime, data$Sub_metering_2, type='l', col="red")
points(data$datetime, data$Sub_metering_3, type='l', col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=1) 
dev.off()
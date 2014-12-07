filePath <- '../../household_power_consumption.txt'
data <- read.table(filePath,  header=TRUE, sep=";",  na.strings="?" )

data <- subset(data, 
              as.Date(Date, format="%d/%m/%Y") >= as.Date('2007-02-01')
              & as.Date(Date, format = "%d/%m/%Y") <= as.Date('2007-02-02'))

data$datetime <- strptime(paste(data$Date, data$Time), "%e/%m/%Y %H:%M:%S")

png(filename="plot2.png", 
    width=480, height=480, 
    units="px",  bg = "transparent");
plot(data$datetime, data$Global_active_power, type='l',
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     main = "")
dev.off()
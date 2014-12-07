filePath <- '../../household_power_consumption.txt'
data <- read.table(filePath,  header=TRUE, sep=";",  na.strings="?" )

data <- subset(data, 
              as.Date(Date, format="%d/%m/%Y") >= as.Date('2007-02-01')
              & as.Date(Date, format = "%d/%m/%Y") <= as.Date('2007-02-02'))

data$datetime <- strptime(paste(data$Date, data$Time), "%e/%m/%Y %H:%M:%S")


png(filename="plot1.png", 
    width=480, height=480, 
    units="px",  bg = "transparent");
hist(data$Global_active_power, 
     xlab = "Global Active Power (kilowatts)",
     col = "red", 
     main = "Global Active Power")
dev.off()
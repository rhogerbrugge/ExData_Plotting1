# plot3.R 
# 
# the assignment states that the data should be read so it is assumed 
# that the data is available (ie. should not be downloaded)

dataFile <- "household_power_consumption.txt"

data <- read.table(dataFile, sep=";", header=T, na.strings="?")

# select the dates
dataSubset <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

dataSubset$Date.Time <- strptime(paste(dataSubset$Date, dataSubset$Time),
                           format="%d/%m/%Y %H:%M:%S")

# draw the plot
png(filename="plot3.png", width=480, height=480)
plot(dataSubset$Date.Time, dataSubset$Sub_metering_1, xlab="",
     ylab="Energy sub metering", main="", type="n")
lines(dataSubset$Date.Time, dataSubset$Sub_metering_1, col="black")
lines(dataSubset$Date.Time, dataSubset$Sub_metering_2, col="red")
lines(dataSubset$Date.Time, dataSubset$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"), lty=1)
dev.off()
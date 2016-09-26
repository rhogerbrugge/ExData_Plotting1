# plot2.R 
# 
# the assignment states that the data should be read so it is assumed 
# that the data is available (ie. should not be downloaded)

dataFile <- "household_power_consumption.txt"

data <- read.table(dataFile, sep=";", header=T, na.strings="?")

# select the dates
dataSubset <- subset(data, Date=="1/2/2007" | Date=="2/2/2007",
               c(Date, Time, Global_active_power))

dataSubset$Date.Time <- strptime(paste(dataSubset$Date, dataSubset$Time),
                           format="%d/%m/%Y %H:%M:%S")
# draw the plot
png(filename="plot2.png", width=480, height=480)
plot(dataSubset$Date.Time, dataSubset$Global_active_power, xlab="",
     ylab="Global active power (kilowatts)", main="", type="n")
lines(dataSubset$Date.Time, dataSubset$Global_active_power)
dev.off()
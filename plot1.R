
# plot1.R 
# 
# the assignment states that the data should be read so it is assumed 
# that the data is available (ie. should not be downloaded)

dataFile <- "household_power_consumption.txt"

data <- read.table(dataFile, sep=";", header=T, na.strings="?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# select the dates
dataSubset <- subset(data, Date=="2007-02-01" | Date=="2007-02-02",
                     Global_active_power)

# draw the plot
png(filename="plot1.png", width=480, height=480)
hist(dataSubset$Global_active_power, xlab="Global Active Power (kilowatts)",
     col="red", main="Global Active Power")
dev.off()
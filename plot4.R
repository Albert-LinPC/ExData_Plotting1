# making plot2.png

# Read data

all.data <- read.csv2("data/household_power_consumption.txt",
                      dec = ".",
                      colClasses = c("character", "character", rep("numeric", 7)),
                      na.strings = "?",
                      stringsAsFactors = FALSE)
all.data$datetime <- strptime(paste(all.data$Date, all.data$Time), "%d/%m/%Y %T")

# We will only be using data from the dates 2007-02-01 and 2007-02-02
plot.data <- all.data[as.Date(all.data$datetime) >= as.Date("2007-02-01") &
                          as.Date(all.data$datetime) <= as.Date("2007-02-02"), ]
rm(all.data)

png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfcol = c(2,2))

n <- nrow(plot.data)
# top left
plot(x = plot.data$datetime,
     y = plot.data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

# bottom left
plot(x = plot.data$datetime,
     y = plot.data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(x = plot.data$datetime, y = plot.data$Sub_metering_2, col = "red")
lines(x = plot.data$datetime, y = plot.data$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, lwd = 1, bty = "n")

# top right
plot(x = plot.data$datetime,
     y = plot.data$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# bottom right
plot(x = plot.data$datetime,
     y = plot.data$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
# making plot2.png

# Read data

all.data <- read.csv2("data/household_power_consumption.txt",
                      dec = ".",
                      colClasses = c("character", "character", rep("numeric", 7)),
                      na.strings = "?",
                      stringsAsFactors = FALSE)

# We will only be using data from the dates 2007-02-01 and 2007-02-02
plot.data <- all.data[all.data$Date %in% c("1/2/2007", "2/2/2007"), ]
rm(all.data)

png(filename = "figure/plot3.png", width = 480, height = 480, units = "px")

n <- nrow(plot.data)

plot(x = 1:n,
     y = plot.data$Sub_metering_1,
     type = "l",
     xaxt = "n",
     xlab = "",
     ylab = "Energy sub metering")
axis(side = 1, at = c(1, n/2, n),
     labels = c("Thu", "Fri", "Sat"))
lines(x = 1:n, y = plot.data$Sub_metering_2, col = "red")
lines(x = 1:n, y = plot.data$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, lwd = 1)

dev.off()
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

png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(x = plot.data$datetime,
     y = plot.data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()
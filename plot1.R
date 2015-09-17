# making plot1.png

# Read data

all.data <- read.csv2("data/household_power_consumption.txt",
                       dec = ".",
                       colClasses = c("character", "character", rep("numeric", 7)),
                       na.strings = "?",
                       stringsAsFactors = FALSE)

# We will only be using data from the dates 2007-02-01 and 2007-02-02
plot.data <- all.data[all.data$Date %in% c("1/2/2007", "2/2/2007"), ]
rm(all.data)

png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(plot.data$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()

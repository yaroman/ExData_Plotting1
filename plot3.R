data <- read.table("eda/household_power_consumption.txt", sep=";", header=TRUE, na.strings = c("?")
        , colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

#----------Filter only two days-----------
dtf <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]

# ------------ Add a new column with date and time values
dtf$DateTime = strptime(paste(dtf$Date, dtf$Time), "%d/%m/%Y %H:%M:%S")

# -----------Create PNG file-------------------
png(file="ExData_Plotting1/plot3.png",width=480,height=480,bg="white")

with(dtf, plot(c(dtf$DateTime,dtf$DateTime,dtf$DateTime), c(dtf$Sub_metering_1, dtf$Sub_metering_2, dtf$Sub_metering_3),type="n", bg="white",xlab="", ylab="Energy sub metering"))

lines(dtf$DateTime, dtf$Sub_metering_1, col="black")
lines(dtf$DateTime, dtf$Sub_metering_2, col="red")
lines(dtf$DateTime, dtf$Sub_metering_3, col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))

dev.off()


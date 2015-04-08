data <- read.table("eda/household_power_consumption.txt", sep=";", header=TRUE, na.strings = c("?")
        , colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

#----------Filter only two days-----------
dtf <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]

# ------------ Add a new column with date and time values
dtf$DateTime = strptime(paste(dtf$Date, dtf$Time), "%d/%m/%Y %H:%M:%S")

# -----------Create PNG file-------------------
png(file="ExData_Plotting1/plot4.png",width=480,height=480,bg="white")

par(mfrow=c(2,2))
with(dtf,
{
	# Plot 1--------
	plot(dtf$DateTime, dtf$Global_active_power, col="black", type="l", xlab="", ylab="Global Active Power")
	
	# Plot 2--------
	plot(dtf$DateTime, dtf$Voltage, col="black", type="l", xlab="datetime", ylab="Voltage")
	
	#- Plot 3--------
	with(dtf, plot(c(dtf$DateTime,dtf$DateTime,dtf$DateTime), c(dtf$Sub_metering_1, dtf$Sub_metering_2, dtf$Sub_metering_3),type="n", bg="white",xlab="", ylab="Energy sub metering"))

	lines(dtf$DateTime, dtf$Sub_metering_1, col="black")
	lines(dtf$DateTime, dtf$Sub_metering_2, col="red")
	lines(dtf$DateTime, dtf$Sub_metering_3, col="blue")
	
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty = "n", lty=c(1,1), col=c("black", "red", "blue"))
	#- third plot======================

	plot(dtf$DateTime, dtf$Global_reactive_power, col="black", type="l", xlab="datetime", ylab="Global_reactive_power")

})

dev.off()




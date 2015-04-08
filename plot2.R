data <- read.table("eda/household_power_consumption.txt", sep=";", header=TRUE, na.strings = c("?")
        , colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

#----------Filter only two days-----------
dtf <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]

# ------------ Add a new column with date and time values
dtf$DateTime = strptime(paste(dtf$Date, dtf$Time), "%d/%m/%Y %H:%M:%S")

# -----------Create PNG file-------------------
png(file="ExData_Plotting1/plot2.png",width=480,height=480,bg="white")

with(dtf, plot(DateTime, Global_active_power,pch=22, type="l", bg="white",xlab="", ylab="Global Active Power (kilowatts)"))

dev.off()


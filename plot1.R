data <- read.table("eda/household_power_consumption.txt", sep=";", header=TRUE, na.strings = c("?"))
dtf <- data[which(as.Date(data$Date) >= as.Date("02/01/2007") & as.Date(data$Date) <= as.Date("02/02/2007")),]


# -----------Create PNG file-------------------
png(file="ExData_Plotting1/plot1.png",width=480,height=480,bg="white")
with(dtf, hist(Global_active_power, col="red", main="Global Active Power",bg="white", xlab="Global Active Power (kilowatts)"))
dev.off()




/#with(dtf, hist(Global_active_power, col="red", main="Global Active Power",bg="white", xlab="Global Active Power (kilowatts)"))
#dev.copy(png, file = "ExData_Plotting1/plot1.png")
#dev.off()



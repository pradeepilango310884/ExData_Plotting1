## Getting full dataset
Power_Consumption_Full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                       check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Subsetting the data for 1st and 2nd Feb
Data_Reqd <- Power_Consumption_Full[Power_Consumption_Full$Date %in% c("1/2/2007","2/2/2007") ,]
rm(Power_Consumption_Full)


##  Subsetting Required Variable Info
datetime <- strptime(paste(Data_Reqd$Date, Data_Reqd$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(Data_Reqd$Global_active_power)
globalReactivePower <- as.numeric(Data_Reqd$Global_reactive_power)
voltage <- as.numeric(Data_Reqd$Voltage)
subMetering_1 <- as.numeric(Data_Reqd$Sub_metering_1)
subMetering_2 <- as.numeric(Data_Reqd$Sub_metering_2)
subMetering_3 <- as.numeric(Data_Reqd$Sub_metering_3)

##plot 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering_2, type="l", col="red")
lines(datetime, subMetering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
## Getting full dataset
Power_Consumption_Full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                       check.names=F, stringsAsFactors=F, comment.char="", quote='\"')


## Subsetting the data for 1st and 2nd Feb
Data_Reqd <- Power_Consumption_Full[Power_Consumption_Full$Date %in% c("1/2/2007","2/2/2007") ,]
rm(Power_Consumption_Full)


##Getting the submeter Data Points Ready
datetime <- strptime(paste(Data_Reqd$Date, Data_Reqd$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering_1 <- as.numeric(Data_Reqd$Sub_metering_1)
subMetering_2 <- as.numeric(Data_Reqd$Sub_metering_2)
subMetering_3 <- as.numeric(Data_Reqd$Sub_metering_3)

##plot3
png("plot3.png", width=480, height=480)
plot(datetime, subMetering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering_2, type="l", col="red")
lines(datetime, subMetering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
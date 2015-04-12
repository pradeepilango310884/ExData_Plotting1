## Getting full dataset
Power_Consumption_Full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                       check.names=F, stringsAsFactors=F, comment.char="", quote='\"')


## Subsetting the data for 1st and 2nd Feb
Data_Reqd <- Power_Consumption_Full[Power_Consumption_Full$Date %in% c("1/2/2007","2/2/2007") ,]
rm(Power_Consumption_Full)


datetime <- strptime(paste(Data_Reqd$Date, Data_Reqd$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(Data_Reqd$Global_active_power)

## Plot 2
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

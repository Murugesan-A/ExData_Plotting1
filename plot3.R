## load data into R 
HPC.Data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",  nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 
HPC.Data$Date <- as.Date(HPC.Data$Date, format="%d/%m/%Y") 

## subset the necessary data 
HPC.Data.Subset <- subset(HPC.Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
# remove unnecessary data
rm(HPC.Data) 

## Create time stamp 
datetime <- paste(as.Date(HPC.Data.Subset$Date), HPC.Data.Subset$Time) 
HPC.Data.Subset$Datetime <- as.POSIXct(datetime) 


## pot graph 
with(HPC.Data.Subset, { 
        plot(Sub_metering_1~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="") 
        lines(Sub_metering_2~Datetime,col='Red') 
        lines(Sub_metering_3~Datetime,col='Blue') 
}
) 

# add annotations
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,  
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 


## create PNG version of file 
dev.copy(png, file="plot3.png", height=480, width=480) 
# release the device
dev.off() 

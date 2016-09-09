## load data into R 
HPC.Data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",  
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 
HPC.Data$Date <- as.Date(HPC.Data$Date, format="%d/%m/%Y") 


## filter data 
HPC.Data.Subset <- subset(HPC.Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
rm(HPC.Data) 


## create time stamp 
datetime <- paste(as.Date(HPC.Data.Subset$Date), HPC.Data.Subset$Time) 
HPC.Data.Subset$Datetime <- as.POSIXct(datetime) 


## define graph area
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) 
with(HPC.Data.Subset, { 
        
        # plot graph
        plot(Global_active_power~Datetime, type="l",  ylab="Global Active Power", xlab="datetime") 
        plot(Voltage~Datetime, type="l",  ylab="Voltage", xlab="datetime") 
        plot(Sub_metering_1~Datetime, type="l",   ylab="Energy sub metering", xlab="datetime") 
        

        # add annotations
        lines(Sub_metering_2~Datetime,col='Red') 
        lines(Sub_metering_3~Datetime,col='Blue') 
        
        
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
        plot(Global_reactive_power~Datetime, type="l", ylab="Global Reactive Power",xlab="datetime") 
}
) 

## create PNG version of the graph 
dev.copy(png, file="plot4.png", height=480, width=480) 
# release the graphics device
dev.off() 

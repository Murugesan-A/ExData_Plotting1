## load data into R 
HPC.Data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?") 
HPC.Data$Date <- as.Date(HPC.Data$Date, format="%d/%m/%Y") 

# read only the necessary data
HPC.Data.Subset <- subset(HPC.Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
# perform clean up - remove unnecessary data set
rm(HPC.Data) 

# create time stamp
datetime <- paste(as.Date(HPC.Data.Subset$Date), HPC.Data.Subset$Time) 
HPC.Data.Subset$Datetime <- as.POSIXct(datetime) 

# plot graph
plot(HPC.Data.Subset$Global_active_power~HPC.Data.Subset$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="") 

# create PNG version of graph
dev.copy(png, file="plot2.png", height=480, width=480) 

# release the device(clean up)
dev.off() 

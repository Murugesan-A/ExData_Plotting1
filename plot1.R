
#load data into R
HPC.Data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?") 

#convert date data into date data type
HPC.Data$Date <- as.Date(HPC.Data$Date, "%d/%m/%Y")

attach(HPC.Data)
#read only th data that is necessary
HPC.Data.Filtered <- subset( HPC.Data, Date >= "2007/02/01" & Date <= "2007/02/02" )
detach(HPC.Data) 

#remove the unnecessay data set
rm(HPC.Data)

#plot the graph
hist(HPC.Data.Filtered$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") 

# create PNG version of the graph
dev.copy(png, file="plot1.png", height=480, width=480) 
# reease the devive
dev.off() 



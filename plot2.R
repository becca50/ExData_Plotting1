# Script to read in the Individual household electric power consumption Data Set from the 
# UC Irvine Machine Learning Repository, recreate a line chart of the Global Active Power 
# variable over the two days, and save it to a .png fle. Assumes the data file is in the working directory.

# Load data. data are on lines 66638 to 69517
epc<-read.csv("household_power_consumption.txt",header=FALSE,sep=";",na.strings = "?",skip=66637,nrows=2880,
col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage", 
                 "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Add date/time variable.
epc$DateTime<-strptime(paste(epc$Date,epc$Time),"%d/%m/%Y %H:%M:%S")

# Launch graphics device.
png("plot2.png",width=480,height=480)

# Call plotting function.
with(epc,plot(DateTime,Global_active_power,type='l',xlab='',
              ylab="Global Active Power (kilowatts)"))

# No additional annotation needed for plot2.

# Close graphics device.
dev.off()



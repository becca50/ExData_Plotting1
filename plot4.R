# Script to read in the Individual household electric power consumption Data Set from the 
# UC Irvine Machine Learning Repository, recreate a plot of 4 charts exploring some variables in 
# the data, and save the plot to a .png fle. Assumes the data file is in the working directory.

# Load data. data are on lines 66638 to 69517
epc<-read.csv("household_power_consumption.txt",header=FALSE,sep=";",na.strings = "?",skip=66637,nrows=2880,
col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage", 
                 "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Add date/time variable.
epc$DateTime<-strptime(paste(epc$Date,epc$Time),"%d/%m/%Y %H:%M:%S")

# Launch graphics device.
png("plot4.png",width=480,height=480)

#Set plot layout.
par(mfrow=c(2,2))

# Call plotting functions.
    # Upper left
with(epc,plot(DateTime,Global_active_power,type='l',xlab='',
              ylab="Global Active Power (kilowatts)"))
    # Upper right
with(epc,plot(DateTime,Voltage,type='l',xlab="datetime"))
    # Lower left
with(epc,plot(DateTime,Sub_metering_1,type='l', xlab='',ylab="Energy sub metering", 
              col="black"))
with(epc,lines(DateTime,Sub_metering_2,type='l',col="red"))
with(epc,lines(DateTime,Sub_metering_3,type='l',col="blue"))
legend("topright",pch="-", lwd=3, col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

    # Lower right
with(epc,plot(DateTime,Global_reactive_power,type='l',
              xlab="datetime"))

# Close graphics device.
dev.off()



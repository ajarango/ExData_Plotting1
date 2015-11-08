#1. read dataset into R
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")
#2. Reformat data into standard date
data$Date <- as.Date(data$Date, format= "%d/%m/%Y")
#3. subset the two days we want
data1 <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
#4. remove the original large "data" set
rm(data)
#5. Convert Datetime
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)
#6. this represents the part that will be changed in each code
# par to gain propper parameters for graphics this took forever
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data1, {
    #Replot "plot 2"
	plot(Global_active_power~Datetime,
		type="l", 
        ylab="Global Active Power",
		xlab="")
    #Voltage with xlab
	plot(Voltage~Datetime,
		type="l", 
        ylab="Voltage",
		xlab="datetime")
    #Replot "plot 3"
	plot(Sub_metering_1~Datetime,
		type="l", 
        ylab="Energy sub metering",
		xlab="")
			lines(Sub_metering_2~Datetime,col='Red')
			lines(Sub_metering_3~Datetime,col='Blue')
				#Add legend to the "topright"
				#Vector (Black, Red Blue)
				legend("topright", col=c("black", "red", "blue"),
					lty=1, lwd=2, bty="n", legend=c("Sub_metering_1",
					"Sub_metering_2", "Sub_metering_3"))
	#Global reactive power labled with underscore and datetime in xlab
	plot(Global_reactive_power~Datetime, type="l", 
         ylab="Global_rective_power",
		 xlab="datetime")
		 })
	



 #7. Save a PNG as "plot4.png" 480 by 480
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
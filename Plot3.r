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
# Plot3 in a line graph with 3 variables
# Arguments submetering vs (~) Datetime (built earlier)
# Plot type is a line graph or type = "l"
# Ylab = "Energy sub metering"
# xlab = "<blank>"
with(data1, {
	plot(Sub_metering_1~Datetime, type= "l",
	ylab= "Energy sub metering",
	xlab= "")
	lines(Sub_metering_2~Datetime, col= "red")
	lines(Sub_metering_3~Datetime, col= "blue")
	})
#Add legend to the "topright"
#Vector (Black, Red Blue)

	legend("topright",
	col= c("Black", "Red", "Blue"),
	lty= 1,
	lwd= 2,
	legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
	)

 #7. Save a PNG as "plot3.png" 480 by 480
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
#1. read dataset into R prog
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
# Plot2 in a line graph 
# Arguments are Global active power vs (~) Datetime built earlier
# Plot type is a line graph or type = "l"
# Ylab = "Global Active Power (kilowatts)"
# xlab = "<blank>"
plot(data1$Global_active_power~data1$Datetime, type="l",
 ylab="Global Active Power (kilowatts)", xlab="")

 #7. Save a PNG as "plot2.png" 480 by 480
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
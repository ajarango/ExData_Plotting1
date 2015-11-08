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
#after loading the two days of date we want build a histogram
#Plot #1 will be labled "Global Active Power" which is a column name
#histogram dataset from column Global active power from data1
hist(data1$Global_active_power, 
	main= "Global Active Power",
	xlab = "Global Active Power (kilowatts)",
	ylab = "Frequency",
	col= "Red",
	breaks = 11)
	
# Save copy as PNG
dev.copy(png, file= "plot1.png", height= 480, width= 480)
dev.off()
	

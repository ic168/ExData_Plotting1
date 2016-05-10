## Figure 3: Plot of Energy Sub Metering for 3 types,
## By day of the week 

hcpFile <- "household_power_consumption.txt" 
data <- read.table(hcpFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
## Reads Household Power Consumption dataset, sets seperator as semicolon, doesn't set strings as factors
## Sets "." as symbol for decimal points
dataSubset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
##Creates subset of Household Power Consumption dataset from 01/02/2007 to 02/02/2007

##head(dataSubset)

day <- strptime(paste(dataSubset$Date, dataSubset$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
## Converts Date and Time Variables to Date/Time classes 
Sub_Metering_1 <- as.numeric(dataSubset$Sub_metering_1)
Sub_Metering_2 <- as.numeric(dataSubset$Sub_metering_2)
Sub_Metering_3 <- as.numeric(dataSubset$Sub_metering_3)
## Coerces Sub_metering_1, Sub_metering_2 and Sub_metering_3 
##to be of type numeric
png("plot3.png", width = 480, height = 480)
## Opens Graphics device for .png files 
plot(day, Sub_Metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(day, Sub_Metering_2, type = "l", col = "red")
lines(day, Sub_Metering_3, type = "l", col = "blue")
## Plot creates the initial Sub_Metering_1 line
## Lines creates the subsequent Sub_Metering_2 and 
## Sub_metering_3 lines, with colors red and blue
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
## Creates legend, setting it at the top right corner, labelling the
## three Sub_metering parameters and specifying their appropriate colors  
dev.off()
## Shuts down graphics device
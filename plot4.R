## Figure 4: Multiple Plots in 1 File
## Plot 1 is line plot of Global Active Power
## Plot 2 is line plot of Voltage  
## Plot 3 is identical to Figure 3
## Plot 4 is line plot of Global Reactive Power

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
globalActivePower <- as.numeric(dataSubset$Global_active_power)
globalReactivePower <- as.numeric(dataSubset$Global_reactive_power)
voltage <- as.numeric(dataSubset$Voltage)
## Coerces Sub_metering_1, Sub_metering_2, Sub_metering_3 
## Global Active Power, Global Reactive Power and Voltage 
##to be of type numeric
png("plot4.png", width = 480, height = 480)
## Opens Graphics device for .png files 
par(mfrow = c(2,2))
## Sets up png file to be split screen, creating a 2 x 2 array of plots
plot(day, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)
## Creates first plot, line plot of Global Active Power
plot(day, voltage, type = "l", xlab = "datetime", ylab = "Voltage") 
## Creates second plot, line plot of Voltage
plot(day, Sub_Metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(day, Sub_Metering_2, type = "l", col = "red")
lines(day, Sub_Metering_3, type = "l", col = "blue")
## Creates Third Plot
## Plot creates the initial Sub_Metering_1 line
## Lines creates the subsequent Sub_Metering_2 and 
## Sub_metering_3 lines, with colors red and blue
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"), bty = "n")
## Creates legend, setting it at the top right corner, labelling the
## three Sub_metering parameters and specifying their appropriate colors
## no border for legend 
plot(day, globalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power") 
## Creates Fourth Plot, for Global Reactive Power
dev.off()
## Shuts down graphics device
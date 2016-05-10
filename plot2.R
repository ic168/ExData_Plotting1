## Figure 2: Plot of Global Active Power by Day of the Week 

hcpFile <- "household_power_consumption.txt" 
data <- read.table(hcpFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
## Reads Household Power Consumption dataset, sets seperator as semicolon, doesn't set strings as factors
## Sets "." as symbol for decimal points
dataSubset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
##Creates subset of Household Power Consumption dataset from 01/02/2007 to 02/02/2007

##head(dataSubset)

day <- strptime(paste(dataSubset$Date, dataSubset$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
## Converts Date and Time Variables to Date/Time classes 
globalActivePower <- as.numeric(dataSubset$Global_active_power)
## Coerces Global_active_power to be of type numeric
png("plot2.png", width = 480, height = 480)
## Opens Graphics device for .png files 
plot(day, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
## Creates the Figure 2 Line Plot, using day as the x variable,
## Global Active Power as the y variable, with the specified y label, with the line type 
dev.off()
## Shuts down graphics device
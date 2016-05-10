## Figure 1: Histogram of Global Active Power

hcpFile <- "household_power_consumption.txt" 
data <- read.table(hcpFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
## Reads Household Power Consumption dataset, sets seperator as semicolon, doesn't set strings as factors
## Sets "." as symbol for decimal points
dataSubset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
##Creates subset of Household Power Consumption dataset from 01/02/2007 to 02/02/2007

##head(dataSubset)

globalActivePower <- as.numeric(dataSubset$Global_active_power)
##coerces Global_active_power to be of type numeric
png("plot1.png", width = 480, height = 480)
##opens Graphics device for .png files 
hist(globalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
##Creates the Figure 1 Histogram, using Global Active Power as the parameter, with the specified title and x label
dev.off()
##Shuts down graphics device
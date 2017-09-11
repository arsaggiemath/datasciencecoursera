file <- ".\\household_power_consumption.txt"
input <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE
                    , dec=".")
subset <- input[input$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
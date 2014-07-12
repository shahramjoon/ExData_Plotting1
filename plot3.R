data <- read.csv ( "household_power_consumption.txt", sep = ";" , header= TRUE, stringsAsFactors = FALSE, na.strings = "?")
data$dttm <- paste(data$Date , data$Time , sep = " " )
data$conversion <- strptime( data$dttm , format="%d/%m/%Y %H:%M:%S")
data[,3] <- as.numeric(data[,3])
data[,4] <- as.numeric(data[,4])
data[,5] <- as.numeric(data[,5])
data[,6] <- as.numeric(data[,6])
data[,7] <- as.numeric(data[,7])
data[,8] <- as.numeric(data[,8])
data[,9] <- as.numeric(data[,9])
x <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
png ( filename="plot3.png" , width=480, height=480)

plot(x$conversion, x$Sub_metering_1,type="l", ylab= "Energy Sub Metering", main = "" , xlab= "" , col="black")
lines (x$conversion,x$Sub_metering_2,type = "l", col = "red")
lines (x$conversion,x$Sub_metering_3,type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), lty= "solid", inset = .05, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
dev.off()


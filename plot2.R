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
png ( filename="plot2.png" , width=480, height=480)

with(x, plot(conversion, Global_active_power,type="l", ylab= "Global Active Power(killowatts)", main = "" , xlab= ""))

dev.off()
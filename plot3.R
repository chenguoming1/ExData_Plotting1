
data<-read.csv(file='household_power_consumption.txt', head=T, sep=';', na.strings="?")
data1<-subset(data, as.Date(data$Date, '%d/%m/%Y') >= as.Date('01/02/2007', '%d/%m/%Y') & as.Date(data$Date, '%d/%m/%Y') <= as.Date('02/02/2007', '%d/%m/%Y'))
data1$datetime<-strptime(paste(data1$Date, data1$Time), "%d/%m/%Y %H:%M:%S")

png(filename="plot3.png", width = 480, height = 480)

plot(data1$datetime, as.double(as.character(data1$Sub_metering_1)), type='l', col='black', ylab="Energy sub metering", xlab=NA)

lines(data1$datetime, as.double(as.character(data1$Sub_metering_2)),  col='red')

lines(data1$datetime, as.double(as.character(data1$Sub_metering_3)), col='blue')

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col=c('black','red','blue'))

dev.off()

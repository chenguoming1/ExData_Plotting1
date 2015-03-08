
data<-read.csv(file='household_power_consumption.txt', head=T, sep=';', na.strings="?")
data1<-subset(data, as.Date(data$Date, '%d/%m/%Y') >= as.Date('01/02/2007', '%d/%m/%Y') & as.Date(data$Date, '%d/%m/%Y') <= as.Date('02/02/2007', '%d/%m/%Y'))
data1$datetime<-strptime(paste(data1$Date, data1$Time), "%d/%m/%Y %H:%M:%S")

png(filename="plot2.png", width = 480, height = 480)

plot(data1$datetime, as.double(as.character(data1$Global_active_power)),xlab=NA, ylab="Global Active Power (kilowatts)", type='l')

dev.off()
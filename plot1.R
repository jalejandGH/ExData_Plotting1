setwd("C:/ADS")
data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",
                 header=TRUE,colClasses=c("character","character",rep("numeric",7)))

data$Date = as.Date(data$Date,"%d/%m/%Y")
data$Time = strptime(data$Time, "%H:%M:%S")

2007-02-01 and 2007-02-02

data=data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]

png(filename="plot1.png",width = 480, height = 480)

hist(data$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()





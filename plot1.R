setwd("C:/ADS")
data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",
                 header=TRUE,colClasses=c("character","character",rep("numeric",7)))

data$DateTime = paste(data$Date,data$Time)
data$DateTime = strptime(data$DateTime,"%d/%m/%Y %H:%M:%S")

#select rows with dates between feb. 1 and feb. 2, 2007
data=data[data$DateTime>="2007-02-01" & data$DateTime<"2007-02-03",]

png(filename="plot1.png",width = 480, height = 480)

hist(data$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()





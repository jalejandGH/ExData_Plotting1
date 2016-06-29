setwd("C:/ADS")
data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",
                 header=TRUE,colClasses=c("character","character",rep("numeric",7)))

data$DateTime = paste(data$Date,data$Time)

data$DateTime2 = strptime(data$DateTime,"%d/%m/%Y %H:%M:%S")

data2=data[!is.na(data$DateTime2),]
data2=data2[data2$DateTime2>="2007-02-01" & data2$DateTime2<="2007-02-03",]

png(filename="plot2.png",width = 480, height = 480)

plot(data2$DateTime2,
     data2$Global_active_power,col="black",ylab="Global Active Power (kilowatts)",type="l",xlab="")
dev.off()






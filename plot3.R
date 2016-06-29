setwd("C:/ADS")
data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",
                 header=TRUE,colClasses=c("character","character",rep("numeric",7)))

data$DateTime = paste(data$Date,data$Time)

data$DateTime = strptime(data$DateTime,"%d/%m/%Y %H:%M:%S")

data2=data[!is.na(data$DateTime),]
data2=data2[data2$DateTime>="2007-02-01" & data2$DateTime<"2007-02-03",]

png(filename="plot3.png",width = 480, height = 480)

plot(data2$DateTime,
     data2$Sub_metering_1,col="black",ylab="Energy sub metering",type="l",xlab="",ylim=c(0,40))
par(new=TRUE)
plot(data2$DateTime,
     data2$Sub_metering_2,col="red",ylab="Energy sub metering",type="l",xlab="",ylim=c(0,40))
par(new=TRUE)
plot(data2$DateTime,
     data2$Sub_metering_3,col="blue",ylab="Energy sub metering",type="l",xlab="",ylim=c(0,40))

legend(x="topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),bty="o",lty=c(1,1,1))
dev.off()






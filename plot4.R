setwd("D:/Education/Coursera/Data Science/Exploratory DA/HW")
my_data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",nrows =2075259,stringsAsFactors=FALSE)
head(my_data)
subset_my_data<-(my_data[,1]=="2/2/2007")|(my_data[,1]=="1/2/2007")
subset_my_data<-my_data[subset_my_data,]
subset_my_data$Date <- strptime(paste(subset_my_data$Date,subset_my_data$Time), "%d/%m/%Y %H:%M:%S")
png(file="plot4.png")
par(mfrow=c(2,2))
with(subset_my_data,{
        plot(Date,Global_active_power,type="l",xlab="",ylab="Global Active Power")
        plot(Date,Voltage,type="l",xlab="datetime",ylab="Voltage")
        plot(Date,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
        lines(Date,Sub_metering_2,col="red")
        lines(Date,Sub_metering_3,col="blue")
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c("solid","solid","solid"),cex=0.8)
        plot(Date,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
        axis(side=2,at=c(0.1,0.2,0.3,0.4,0.5,0.6),font=0.8)
})
dev.off()

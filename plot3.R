setwd("D:/Education/Coursera/Data Science/Exploratory DA/HW")
my_data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",nrows =2075259,stringsAsFactors=FALSE)
head(my_data)
subset_my_data<-(my_data[,1]=="2/2/2007")|(my_data[,1]=="1/2/2007")
subset_my_data<-my_data[subset_my_data,]
subset_my_data$Date <- strptime(paste(subset_my_data$Date,subset_my_data$Time), "%d/%m/%Y %H:%M:%S")
png(file="plot3.png")
with(subset_my_data,{
        plot(Date,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
        lines(Date,Sub_metering_2,col="red")
        lines(Date,Sub_metering_3,col="blue")
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c("solid","solid","solid"))
        })
dev.off()
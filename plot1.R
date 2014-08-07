setwd("D:/Education/Coursera/Data Science/Exploratory DA/HW")
my_data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",nrows =2075259,stringsAsFactors=FALSE)
head(my_data)
subset_my_data<-(my_data[,1]=="2/2/2007")|(my_data[,1]=="1/2/2007")
subset_my_data<-my_data[subset_my_data,]
png(file="plot1.png")
with(subset_my_data,hist(Global_active_power,main = "Global Active Power",xlab="Global Active Power (kilowatts)",col="red"))
dev.off()
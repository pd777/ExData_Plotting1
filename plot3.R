##### setwd("D:/Documents and Settings/w74927/My Documents/Software/Courserra/R/Exploratory Data Analysis")
SelectedData<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
SelectedDates<-subset(SelectedData, SelectedData$Date=="1/2/2007" | SelectedData$Date=="2/2/2007")

### edit(SelectedDates)
### str(SelectedDates)
SelectedDates$DateTime<-strptime(paste(SelectedDates$Date,SelectedDates$Time),format="%d/%m/%Y %H:%M:%S",tz = "")
SelectedDates$Power<-as.numeric(SelectedDates$Global_active_power)
x<-SelectedDates$DateTime
a<-as.numeric(SelectedDates$Sub_metering_1)
b<-as.numeric(SelectedDates$Sub_metering_2)
c<-SelectedDates$Sub_metering_3
png(file="plot3.png")
plot(x,a,type="line", col="black",xlab="",ylab="Energy sub metering")
lines(x,b,type="line",col="red")
lines(x,c,type="line",col="blue")

legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
### legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),col=c("black","blue","red"))
dev.off()

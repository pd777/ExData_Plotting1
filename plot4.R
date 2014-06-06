##### setwd("D:/Documents and Settings/w74927/My Documents/Software/Courserra/R/Exploratory Data Analysis")
SelectedData<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
SelectedDates<-subset(SelectedData, SelectedData$Date=="1/2/2007" | SelectedData$Date=="2/2/2007")

### edit(SelectedDates)
### str(SelectedDates)
SelectedDates$DateTime<-strptime(paste(SelectedDates$Date,SelectedDates$Time),format="%d/%m/%Y %H:%M:%S",tz = "")
SelectedDates$Power<-as.numeric(SelectedDates$Global_active_power)
x<-SelectedDates$DateTime
p<-SelectedDates$Power

png(file="plot4.png")
par(mfrow=c(2,2),mar=c(4,4,2,1))
###########################
plot(x,p,type="line",xlab="",ylab="Global Active Power")
###########################
voltage<-as.numeric(SelectedDates$Voltage)
plot(x,voltage,type="line",ylab="Voltage",xlab="datetime")
###########################
a<-as.numeric(SelectedDates$Sub_metering_1)
b<-as.numeric(SelectedDates$Sub_metering_2)
c<-SelectedDates$Sub_metering_3
plot(x,a,type="line", col="black",xlab="",ylab="Energy sub metering")
lines(x,b,type="line",col="red")
lines(x,c,type="line",col="blue")
legend("topright",bty="n",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),lty=c(1,1,1),col=c("black","blue","red"))
############################
grp<-as.numeric(SelectedDates$Global_reactive_power)
plot(x,grp,type="line",xlab="datetime",ylab="Global_reactive_power")
dev.off()

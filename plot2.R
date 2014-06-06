##################################################################################
###  Plot2
### Line Chart with dates converted in x-axis
### Assumes data resides in current working directory
##################################################################################

SelectedData<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
SelectedDates<-subset(SelectedData, SelectedData$Date=="1/2/2007" | SelectedData$Date=="2/2/2007")

### edit(SelectedDates)
### str(SelectedDates)
SelectedDates$DateTime<-strptime(paste(SelectedDates$Date,SelectedDates$Time),format="%d/%m/%Y %H:%M:%S",tz = "")
SelectedDates$Power<-as.numeric(SelectedDates$Global_active_power)
### par(mfrow = c(1, 1), mar = c(6, 4, 2, 1))
x<-SelectedDates$DateTime
p<-SelectedDates$Power
plot(x,p,type="line",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()

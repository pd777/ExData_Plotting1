##################################################################################
###  Plot1
### Histogram
### Assumes data resides in current working directory
##################################################################################
### setwd("D:/Documents and Settings/w74927/My Documents/Software/Courserra/R/Exploratory Data Analysis")

SelectedData<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
SelectedDates<-subset(SelectedData, SelectedData$Date=="1/2/2007" | SelectedData$Date=="2/2/2007")

### edit(SelectedDates)
### str(SelectedDates)
SelectedDates$Power<-as.numeric(SelectedDates$Global_active_power)
hist(SelectedDates$Power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.copy(png,file="plot1.png")
dev.off()

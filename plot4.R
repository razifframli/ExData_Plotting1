##Read File
datafile<-read.csv("household_power.txt",header=T,sep=';',na.string='?',check.names=F,stringsAsFactors=F,comment.char="")

##Format date
datafile$Date<-as.Date(datafile$Date,format="%d/%m/%Y")

##Subsetting data
data<-subset(datafile,subset=(Date>="2007-02-01" & Date<="2007-02-02"))

##Combine Date and Time as datatime
datetime <- paste(as.Date(data$Date), data$Time)

##Add Datetime as new column
data$Datetime <- as.POSIXct(datetime)

##Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
  
  with(data, {
    plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power",xlab="")
    
    plot(data$Voltage~data$Datetime, type="l",ylab="Voltage", xlab="datetime")
    
    plot(Sub_metering_1~Datetime, type="l", 
         ylab="Global sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(data$Global_reactive_power~data$Datetime, type="l",ylab="Global_reactive_power", xlab="datetime")
    
  })

##Save to PNG file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
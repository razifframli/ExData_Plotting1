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

##Plot 2
plot(data$Global_active_power~data$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")

##Save to PNG file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
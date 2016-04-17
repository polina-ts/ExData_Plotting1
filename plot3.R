#opening file
household <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")

#converting the Date and Time variables to Date/Time classes
household$DateTime = paste(household$Date, household$Time)
household$DateTime = as.POSIXlt(household$DateTime,format="%d/%m/%Y %H:%M:%S")
household$Date = NULL
household$Time = NULL

#subsetting needed data
hhf <- subset(household,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

#creating plot
png(filename = "plot3.png",width = 480, height = 480)
plot(x=(hhf$DateTime),y=hhf$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=(hhf$DateTime),y=hhf$Sub_metering_2,col="red")
lines(x=(hhf$DateTime),y=hhf$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.7)
dev.off()
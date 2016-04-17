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
png(filename = "plot1.png",width = 480, height = 480)
hist(hhf$Global_active_power, main = "Global active power", ylab = "Global active power (kilowatts)", col = "red")
dev.off()
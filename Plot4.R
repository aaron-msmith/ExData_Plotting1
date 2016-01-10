# determine classes
initial <- read.table("household_power_consumption.txt", sep = ";", nrows = 100)
classes <- sapply(initial, class)

#Read in data file
mydata<-read.table("household_power_consumption.txt", colClasses=classes, header=TRUE, sep=";")

#subset for feb 1 - feb 2, 2007
newdata<-subset(mydata, Date =='1/2/2007' | Date =='2/2/2007')

#remove temp variables
rm(initial,mydata)

# format date as date
date<-as.Date(newdata$Date, format="%d/%m/%Y")

#combine date and time
combo<-paste(date,newdata$Time)

#create datetime stamp
newdatetime<-strptime(combo, format="%Y-%m-%d %H:%M:%S")

#set GAP
GAP<-as.numeric(newdata$Global_active_power)*2/1000

#initiate png
png(filename = "Plot4.png")

par(mfrow=c(2,2),mar=c(4,4,2,2))

#create plot 1
plot(newdatetime, GAP, type="l", ylab="Global Active Power (Kilowatts)",xlab="")

#create plot 2
plot(newdatetime, newdata$Voltage, type="l", ylab="Voltage",xlab="datetime")

#create plot3

plot(newdatetime, newdata$Sub_metering_1, type="l", ylab="Energy sub metering",xlab="")
lines(newdatetime,newdata$Sub_metering_2,col="red")
lines(newdatetime,newdata$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"),lty=c(1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#create plot4
plot(newdatetime, newdata$Global_reactive_power, type="l", ylab="Global Reactive Power",xlab="datetime")

#turn off png
dev.off()
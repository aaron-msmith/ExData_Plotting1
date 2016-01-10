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

#initiate png
png(filename = "Plot3.png")

#create plot
plot(newdatetime, newdata$Sub_metering_1, type="l", ylab="Energy sub metering",xlab="")
lines(newdatetime,newdata$Sub_metering_2,col="red")
lines(newdatetime,newdata$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"),lty=c(1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#turn off png
dev.off()
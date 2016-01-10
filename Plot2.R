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

#set GAP
GAP<-as.numeric(newdata$Global_active_power)*2/1000
#create datetime stamp
newdatetime<-strptime(combo, format="%Y-%m-%d %H:%M:%S")

#initiate png
png(filename = "Plot2.png")

#create plot
plot(newdatetime, GAP, type="l", ylab="Global Active Power (Kilowatts)",xlab="")

#turn off png
dev.off()
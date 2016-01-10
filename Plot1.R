# determine classes
initial <- read.table("household_power_consumption.txt", sep = ";", nrows = 100)
classes <- sapply(initial, class)

#Read in data file
mydata<-read.table("household_power_consumption.txt", colClasses=classes, header=TRUE, sep=";")

#subset for feb 1 - feb 2, 2007
newdata<-subset(mydata, Date =='1/2/2007' | Date =='2/2/2007')

#initiate png
png(filename = "Plot1.png")

'create histogram'
hist(((as.numeric(newdata$Global_active_power))*2)/1000, col='red', main ='Global Active Power',xlab='Global Active Power (Kilowatts)')

#turn off png
dev.off()

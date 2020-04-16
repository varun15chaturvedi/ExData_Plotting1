# Loading Data from dataset and only keeping data related to dates
# "2007-02-01" and "2007-02-02"

data<- read.table('household_power_consumption.txt',sep = ';',header = T)
data$Date<- as.Date(data$Date,'%d/%m/%Y')
rows<- (data$Date>="2007-02-01" & data$Date<= "2007-02-02")
data<- data[rows,]
remove(rows)

  
#global data
temp<- paste(data$Date,data$Time,sep = ' ')
temp<- strptime(temp,"%Y-%m-%d %H:%M:%S")
data$Global_active_power<- as.numeric(data$Global_active_power)/500

#opening Graphic Device

png(filename ='plot4.png',height = 480,width = 480 )
par(mfcol= c(2,2),mar=c(4,4,4,5.1))

#first row first col plot

plot(temp, data$Global_active_power,pch ='|',ylab = 'Global Active Power(Kilowatts)',xlab ='',type = 'l' )

#first col second row plot
data$Sub_metering_1<- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<- as.numeric(as.character(data$Sub_metering_3))
plot(temp,data$Sub_metering_1,pch ="|",type = "l",xlab = "",ylab = "Energy sub metering",col= "black",ygap.axis = 2)
points(temp,data$Sub_metering_2,pch ="|",type = "l",col= "red")
points(temp,data$Sub_metering_3,pch ="|",type = "l",col= "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),pch = c("_","_","_"),seg.len = 5)


#first row second col plot
data$Voltage<- as.numeric(as.character(data$Voltage))
plot(temp,data$Voltage,type = "l",ylab = "Voltage",xlab = "datetime")

#second row second col plot
data$Global_reactive_power<- as.numeric(as.character(data$Global_reactive_power))
plot(temp,data$Global_reactive_power,type = "l",ylab = "Global_reactive_power",xlab = "datetime")

dev.off()

